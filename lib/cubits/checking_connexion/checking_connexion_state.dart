part of 'checking_connexion_cubit.dart';

@immutable
sealed class CheckingConnexionState {}

final class CheckingConnexionInitial extends CheckingConnexionState {}

final class NoInternetConnexion extends CheckingConnexionState {}

final class ThereIsInternetConnexion extends CheckingConnexionState {}
