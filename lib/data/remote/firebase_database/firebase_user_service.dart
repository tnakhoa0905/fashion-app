import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fashion_app/core/utils/constants.dart';
import 'package:fashion_app/domain/entities/account/user.dart';
import 'package:http/http.dart' as http;

abstract class FirebaseUserService {
  Future<void> createUserProfile(
      UserModel user, String userName, String passWord);
  Future<UserModel?> getUserProfileById(String userUid);
  Future<void> updateUserProfile(UserModel user, String userUid);
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
        'password': passWord
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
    } catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<UserModel?> getUserProfileById(String userName) async {
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
    // print(jsonDecode(response.body[0]));
    List<dynamic> result = jsonDecode(response.body);

    if (result.isEmpty) {
      print('no user');
      return null;
    } else {
      print("user already exists");
      return UserModel.fromMap(jsonDecode(response.body[0]));
    }
  }

  @override
  updateUserProfile(UserModel user, String userUid) async {
    await firestore
        .collection(AppConstants.usersCollection)
        .doc(userUid)
        .update(user.toMap());
  }

  @override
  deleteUserProfile(userUid) async {
    await firestore
        .collection(AppConstants.usersCollection)
        .doc(userUid)
        .delete();
  }
}
