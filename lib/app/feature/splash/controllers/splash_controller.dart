import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'splash_state.dart';

class SplashController extends Cubit<SplashState> {
  SplashController({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth,
        super(const SplashState.initial());

  final FirebaseAuth _firebaseAuth;

  void isLogged() {
    state.copyWith(isLogged: _firebaseAuth.currentUser != null);
  }
}
