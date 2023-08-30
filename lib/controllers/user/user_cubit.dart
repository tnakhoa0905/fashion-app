import 'package:equatable/equatable.dart';
// import 'package:fashion_app/config/services/prefs.dart';
// import 'package:fashion_app/config/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fashion_app/config/routes/route_context.dart';
import 'package:fashion_app/core/functions/function.dart';
import 'package:fashion_app/domain/entities/account/user.dart';
import 'package:fashion_app/domain/usecases/user/delete_user_profile_usecase.dart';
import 'package:fashion_app/domain/usecases/user/get_user_profile_by_id_usecase.dart';
import 'package:fashion_app/domain/usecases/user/save_user_profile_usecase.dart';
import 'package:fashion_app/domain/usecases/user/update_user_profile_usecase.dart';

import '../../domain/entities/account/user_api.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._getUsecase, this._saveUsecase, this._deleteUsecase,
      this._updateusecase)
      : super(UserInitial());

  final GetUserProfileByIdUseCase _getUsecase;
  final UpdateUserProfileUsecase _updateusecase;
  final DeleteUserProfileUsecase _deleteUsecase;
  final SaveUserProfileUsecase _saveUsecase;
  UserApi? _user;

  UserApi? get user {
    if (_user != null) {
      return _user!;
    } else {
      return null;
    }
  }

  // read
  getUserProfileById(String? userName) async {
    if (userName == null) {
      return;
    }
    print(userName);
    (await _getUsecase.call(userName)).fold(
      (failure) {
        //   showToastMessage(failure.message);
        emit(UserFailure());
      },
      (userModel) {
        _user = userModel;
        emit(UserLoaded());
      },
    );
  }

  // create
  Future<void> createUserprofile(
      UserModel entity, String userName, String passWord) async {
    print('show in UserCubit');
    print(entity);
    (await _saveUsecase.call(SaveUserInputs(entity, userName, passWord))).fold(
      (failure) {
        // showToastMessage(failure.message);
        print('faild');
        print(failure.message);
        emit(UserFailure());
      },
      (r) {
        print('created');
        emit(UserCreated());
      },
    );
  }

// delete
  deleteUserProfile(String userUid) async {
    (await _deleteUsecase.call(userUid)).fold(
      (failure) {
        showToastMessage(failure.message);
        emit(UserFailure());
      },
      (r) {
        emit(UserDeleted());
      },
    );
  }

  // update
  updateUserProfile(BuildContext context,
      {String? username,
      String? email,
      String? phone,
      String? location,
      String? profilePhoto,
      String? zipcode}) async {
    if (_user != null) {
      final newUser = _user!.copyWith(
          id: 101,
          username: username,
          email: email,
          avatarUrl: profilePhoto,
          shipping: Ing(
              firstName: '',
              lastName: 'lastName',
              company: 'company',
              address1: 'address1',
              address2: 'address2',
              city: 'city',
              postcode: 'postcode',
              country: 'country',
              state: 'state',
              phone: phone));

      (await _updateusecase.call(UpdateUserInputs(newUser, newUser.email)))
          .fold(
        (failure) {
          showToastMessage(failure.message);
          emit(UserFailure());
        },
        (r) {
          emit(UserUpdated());
          getUserProfileById(newUser.email);
        },
      );
    }

    showToastMessage('User Profile Updated');
    // ignore: use_build_context_synchronously
    context.back();
  }
}
