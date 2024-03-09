part of 'auth_cubit.dart';

class AuthState {}

final class AuthInitial extends AuthState {}

final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpFailure extends AuthState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}

final class SignInLoading extends AuthState {}

final class SignInSuccess extends AuthState {}

final class SignInFailure extends AuthState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

final class LogoutLoading extends AuthState {}

final class LogoutSuccess extends AuthState {}

final class LogoutFailure extends AuthState {
  final String errMessage;

  LogoutFailure({required this.errMessage});
}

final class UserFetched extends AuthState {
  // final User user;

  // UserFetched({required this.user});
}

final class GetUserLoading extends AuthState {}

final class PasswordVisibilityChanged extends AuthState {}