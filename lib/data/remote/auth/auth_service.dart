// import 'package:firebase_auth/firebase_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthService {
  Future<User?> singUpFirebase(String username, String email, String password);
  Future<User?> loginFirebase(String email, String password);
  Future<void> signOutFirebase();
  Future<User?> signInWithGoogle();
  // Future<User?> signInWithFacebook();
  Future<void> verifyPhoneNumber(String phone);
  Future<void> resetPassword(String email);
  Future<void> sendEmailVerification();
  Future<void> updatePassword(String password);
  Future<void> updateEmail(String newEmail);
  Future<void> updateUsername(String username);
  Future<void> updateProfileImage(String image);
  Future<void> reAuthenticatesUser(String email, String password);
  User? get getUserProfile;
  String? get getUserId;
}
