part of 'profile_cubit_cubit.dart';

@immutable
sealed class ProfileCubitState {}

final class ProfileCubitInitial extends ProfileCubitState {}

final class UserFetched extends ProfileCubitState {
  // final User user;

  // UserFetched({required this.user});
}

final class GetUserLoading extends ProfileCubitState {}
