// ignore_for_file: void_checks

import 'dart:ffi';

import 'package:dartz/dartz.dart';

import 'package:fashion_app/core/errors/failure.dart';
import 'package:fashion_app/data/data_source/user_remote_data_source.dart';

import 'package:fashion_app/domain/entities/account/user.dart';

import '../../domain/repository/repositories.dart';

class FirebaseUserRepositoryImpl implements FirebaseUserRepository {
  final UserRemoteDataSource _dataSource;
  FirebaseUserRepositoryImpl(this._dataSource);
  @override
  Future<Either<Failure, UserModel>> getUserProfileById(String userUid) async {
    try {
      print('Getuser API imp');
      final doc = await _dataSource.getUserProfileById(userUid);
      if (doc != null) {
        return Right(doc);
      }
      return const Left(FirebaseFailure("User Not Exist"));
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createUserProfile(
      UserModel user, String userName, String passWord) async {
    print('create user firebase imp');
    try {
      print('on func');
      final doc = await _dataSource.getUserProfileById(userName);
      if (doc != null) {
        return const Left(FirebaseFailure('User Already Exist'));
      }
      await _dataSource.createUserProfile(user, userName, passWord);
      return const Right(Void);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUserProfile(String userUid) async {
    try {
      await _dataSource.deleteUserProfile(userUid);
      return const Right(Void);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserProfile(
      UserModel user, String usersUid) async {
    try {
      await _dataSource.updateUserProfile(user, usersUid);
      return const Right(Void);
    } catch (e) {
      return Left(FirebaseFailure(e.toString()));
    }
  }
}
