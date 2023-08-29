import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fashion_app/core/utils/constants.dart';
import 'package:fashion_app/domain/entities/account/user.dart';
import 'package:fashion_app/domain/entities/account/user_api.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class FirebaseUserService {
  Future<void> createUserProfile(
      UserModel user, String userName, String passWord);
  Future<UserApi?> getUserProfileById(String userUid);
  Future<void> updateUserProfile(UserApi user, String userUid);
  Future<void> deleteUserProfile(String userUid);
}

class FirebaseUserServiceImpl implements FirebaseUserService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  createUserProfile(UserModel user, String userName, String passWord) async {
    // await firestore
    //     .collection(AppConstants.usersCollection)
    //     .doc(userUid)
    //     .set(user.toMap());
    print('on create profile');
    try {
      final param = {
        'consumer_key': 'ck_b224bb54e462bfa5adb9f220fe7af19cdf3355ba',
        'consumer_secret': 'cs_95eeec6d48257b3cd5d085c376228d1d5f9bf4eb',
        'email': userName,
        'password': passWord.isEmpty ? '123456' : passWord
      };

      final response = await http.post(
          Uri.https('martsimple.com', '/wp-json/wc/v3/customers', param),
          headers: {'Content-Type': 'text/plain'},
          body: jsonEncode({
            "email": userName,
            "first_name": user.username,
            "last_name": user.username,
            "username": user.username,
          }));
      print('sigup with API');
      print(response.body);
      print('ok');
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<UserApi?> getUserProfileById(String userName) async {
    print('GetUser on service');
    final param = {
      'consumer_key': 'ck_b224bb54e462bfa5adb9f220fe7af19cdf3355ba',
      'consumer_secret': 'cs_95eeec6d48257b3cd5d085c376228d1d5f9bf4eb',
      'email': userName
    };
    final response = await http.get(
      Uri.https('martsimple.com', '/wp-json/wc/v3/customers', param),
      headers: {
        'Content-Type': 'text/plain',
      },
    );

    List<dynamic> result = jsonDecode(response.body);
    print(result);
    if (result.isEmpty) {
      print('resutlt is empty');
      return null;
    } else {
      print("user already exists");
      print(UserApi.fromJson(result[0]));
      return UserApi.fromJson(result[0]);
    }
  }

  @override
  updateUserProfile(UserApi user, String userUid) async {
    // await firestore
    //     .collection(AppConstants.usersCollection)
    //     .doc(userUid)
    //     .update(user.toJson());
    try {
      print('update user on service');
      print(userApiToJson(user));
      final param = {
        'consumer_key': 'ck_b224bb54e462bfa5adb9f220fe7af19cdf3355ba',
        'consumer_secret': 'cs_95eeec6d48257b3cd5d085c376228d1d5f9bf4eb',
      };
      final response = await http.put(
          Uri.https(
              'martsimple.com', '/wp-json/wc/v3/customers/${user.id}', param),
          headers: {
            'Content-Type': 'text/plain',
          },
          body: jsonEncode(userApiToJson(user)));

      if (response.statusCode == 200) {
        print('update Success');
      }
    } catch (e) {
      print(e);
      throw Exception();
    }
    // if (result.isEmpty) {
    //   print('resutlt is empty');
    //   return null;
    // } else {
    //   print("user already exists");
    //   print(UserApi.fromJson(result[0]));
    //   return UserApi.fromJson(result[0]);
    // }
  }

  @override
  deleteUserProfile(userUid) async {
    await firestore
        .collection(AppConstants.usersCollection)
        .doc(userUid)
        .delete();
  }
}
