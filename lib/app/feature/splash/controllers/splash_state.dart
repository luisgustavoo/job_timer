// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_controller.dart';

class SplashState extends Equatable {
  const SplashState._({required this.isLogged});

  const SplashState.initial() : this._(isLogged: false);

  final bool isLogged;

  SplashState copyWith({
    bool? isLogged,
  }) {
    return SplashState._(
      isLogged: isLogged ?? this.isLogged,
    );
  }

  @override
  List<Object?> get props => [isLogged];
}
