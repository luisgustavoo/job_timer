import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  LoginController({required AuthService authService})
      : _authService = authService,
        super(const LoginState.intial());

  final AuthService _authService;

  Future<void> signIn() async {
    emit(state.copyWith(status: LoginStatus.loading));
    // await _authService.signIn();
    // log('Chamou a sigIn');
  }
}
