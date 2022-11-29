import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_timer/app/core/errors/google_user_not_found.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';

class AuthServiceImpl implements AuthService {
  const AuthServiceImpl({
    required GoogleSignIn googleSigIn,
    required FirebaseAuth firebaseAuth,
  })  : _googleSigIn = googleSigIn,
        _firebaseAuth = firebaseAuth;

  final GoogleSignIn _googleSigIn;
  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> signIn() async {
    final googleUser = await _googleSigIn.signIn();
    if (googleUser == null) {
      throw const GoogleUserNotFound(errorMessage: 'Nenhuma conta selecionada');
    }
    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSigIn.disconnect();
    } on PlatformException catch (e, s) {
      log('Erro ao fazer signOut', error: e, stackTrace: s);
    }
  }
}
