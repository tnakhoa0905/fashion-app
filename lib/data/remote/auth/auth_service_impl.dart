import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:fashion_app/core/errors/exceptions.dart';
import 'package:fashion_app/core/utils/strings.dart';
import 'package:fashion_app/data/remote/auth/auth_service.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthServiceImpl implements AuthService {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  SupabaseClient supabase = Supabase.instance.client;
  @override
  Future<User?> singUpFirebase(
      String username, String email, String password) async {
    try {
      final res = await supabase.auth.signUp(email: email, password: password);
      final User? user = res.user;
      return user;

      //  on FirebaseAuthException catch (e) {
      //   if (e.code == 'weak-password') {
      //     throw AuthException(message: AppStrings.passwordProvidedWeak);
      //   } else if (e.code == 'email-already-in-use') {
      //     throw AuthException(message: AppStrings.accountAlreadyExists);
      //   }
    } catch (e) {
      throw Exception(e);
    }
    // return null;
  }

  @override
  Future<User?> loginFirebase(String email, String password) async {
    try {
      final res = await supabase.auth
          .signInWithPassword(email: email, password: password);
      final User? user = res.user;
      return user;
      // }
      //  on FirebaseAuthException catch (e) {
      //   if (e.code == 'user-not-found') {
      //     throw AuthException(message: AppStrings.userNotFound);
      //   } else if (e.code == 'wrong-password') {
      //     throw AuthException(message: AppStrings.wrongPassword);
      //   }
    } catch (e) {
      throw Exception(e);
    }
    // return null;
  }

  @override
  signOutFirebase() async {
    await supabase.auth.signOut();
  }

  @override
  Future<User?> signInWithGoogle() async {
    // // Trigger the authentication flow
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // // Obtain the auth details from the request
    // final GoogleSignInAuthentication? googleAuth =
    //     await googleUser?.authentication;

    // // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );

    // // Once signed in, return the User
    // return (await auth.signInWithCredential(credential)).user;
    const appAuth = FlutterAppAuth();

    // Just a random string
    final rawNonce = _generateRandomString();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    /// TODO: update the iOS and Android client ID with your own.
    ///
    /// Client ID that you registered with Google Cloud.
    /// You will have two different values for iOS and Android.
    final clientId = Platform.isIOS
        ? '9358066829-oecrial4h2a7k6umj9pr01hklnpkhe6b.apps.googleusercontent.com'
        : '9358066829-pfe875gr0heh8dgtbfins62m5lud64fn.apps.googleusercontent.com';

    /// Set as reversed DNS form of Google Client ID + `:/` for Google login
    final redirectUrl = '${clientId.split('.').reversed.join('.')}:/';

    /// Fixed value for google login
    const discoveryUrl =
        'https://accounts.google.com/.well-known/openid-configuration';

    // authorize the user by opening the concent page
    final result = await appAuth.authorize(
      AuthorizationRequest(
        clientId,
        redirectUrl,
        discoveryUrl: discoveryUrl,
        nonce: hashedNonce,
        scopes: [
          'openid',
          'email',
          'profile',
        ],
      ),
    );

    if (result == null) {
      throw 'No result';
    }

    // Request the access and id token to google
    final tokenResult = await appAuth.token(
      TokenRequest(
        clientId,
        redirectUrl,
        authorizationCode: result.authorizationCode,
        discoveryUrl: discoveryUrl,
        codeVerifier: result.codeVerifier,
        nonce: result.nonce,
        scopes: [
          'openid',
          'email',
        ],
      ),
    );

    final idToken = tokenResult?.idToken;

    if (idToken == null) {
      throw 'No idToken';
    }

    final res = await supabase.auth.signInWithIdToken(
      provider: Provider.google,
      idToken: idToken,
      nonce: rawNonce,
    );

    return res.user;
  }

  String _generateRandomString() {
    final random = Random.secure();
    return base64Url.encode(List<int>.generate(16, (_) => random.nextInt(256)));
  }

  // @override
  // Future<User?> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();

  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the User
  //   return (await auth.signInWithCredential(facebookAuthCredential)).user;
  // }

  @override
  Future<void> verifyPhoneNumber(String phone) async {
    // await auth.verifyPhoneNumber(
    //   phoneNumber: phone,
    //   verificationCompleted: (PhoneAuthCredential credential) async {
    //     // ANDROID ONLY!

    //     // Sign the user in (or link) with the auto-generated credential
    //     await auth.signInWithCredential(credential);
    //   },
    //   verificationFailed: (FirebaseAuthException e) {
    //     if (e.code == 'invalid-phone-number') {
    //       throw AuthException(message: AppStrings.invaildPhoneNumber);
    //     }
    //     // Handle other errors
    //   },
    //   codeSent: (String verificationId, int? resendToken) {},
    //   codeAutoRetrievalTimeout: (String verificationId) {},
    // );
  }

  @override
  Future<void> resetPassword(String email) async {
    // await auth.sendPasswordResetEmail(email: email);
  }

  @override
  User? get getUserProfile {
    return supabase.auth.currentUser;
  }

  @override
  Future<void> sendEmailVerification() async {
    // final user = getUserProfile;
    // if (user != null) {
    //   await user.sendEmailVerification();
    // } else {
    //   return;
    // }
  }

  @override
  Future<void> updatePassword(String password) async {
    // final user = getUserProfile;
    // if (user != null) {
    //   await user.updatePassword(password);
    // } else {
    //   return;
    // }
  }

  @override
  Future<void> updateUsername(String username) async {
    // final user = getUserProfile;
    // if (user != null) {
    //   await user.updateDisplayName(username);
    // } else {
    //   return;
    // }
  }

  @override
  Future<void> updateProfileImage(String image) async {
    // final user = getUserProfile;
    // if (user != null) {
    //   await user.updatePhotoURL(image);
    // } else {
    //   return;
    // }
  }

  @override
  String? get getUserId => supabase.auth.currentUser?.id;

  @override
  Future<void> updateEmail(String newEmail) async {
    // try {
    //   final user = getUserProfile;
    //   if (user != null) {
    //     await user.updateEmail(newEmail);
    //   } else {
    //     return;
    //   }
    // } on FirebaseAuthException catch (e) {
    //   throw AuthException(message: e.message ?? e.toString());
    // }
  }

  @override
  Future<void> reAuthenticatesUser(String email, String password) async {
    // User? user = auth.currentUser;

    // if (user != null) {
    //   AuthCredential credential =
    //       EmailAuthProvider.credential(email: email, password: password);

    //   try {
    //     await user.reauthenticateWithCredential(credential);
    //     // User has been successfully reauthenticated
    //   } on FirebaseAuthException catch (e) {
    //     throw AuthException(message: e.message ?? e.toString());
    //   }
    // }
  }
}
