import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/errors/google_user_not_found.dart';
import 'package:job_timer/app/services/auth/auth_service.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  LoginController({required AuthService authService})
      : _authService = authService,
        super(const LoginState.intial());

  final AuthService _authService;

  Future<void> signIn() async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      await _authService.signIn();
    } on GoogleUserNotFound catch (e, s) {
      log('${e.errorMessage}', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: e.errorMessage,
        ),
      );
    } on Exception catch (e, s) {
      log('Erro ao fazer login', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: 'Erro ao fazer login',
        ),
      );
    }
  }
}
