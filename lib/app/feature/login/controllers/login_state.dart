// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_controller.dart';

enum LoginStatus { intial, loading, failure }

class LoginState extends Equatable {
  const LoginState._({
    required this.status,
    this.errorMessage,
    this.logged = false,
  });

  const LoginState.intial() : this._(status: LoginStatus.intial);

  final LoginStatus status;
  final String? errorMessage;
  final bool logged;

  @override
  List<Object?> get props => [status, errorMessage, logged];

  LoginState copyWith({
    LoginStatus? status,
    String? errorMessage,
    bool logged = false,
  }) {
    return LoginState._(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      logged: logged,
    );
  }
}
