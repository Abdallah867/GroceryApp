import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'checking_connexion_state.dart';

class CheckingConnexionCubit extends Cubit<CheckingConnexionState> {
  CheckingConnexionCubit() : super(CheckingConnexionInitial());

  late StreamSubscription<ConnectivityResult?> subscription;

  trackInternetConnexion() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        emit(NoInternetConnexion());
      } else {
        emit(ThereIsInternetConnexion());
      }
    });
  }

  void dispose() {
    subscription.cancel();
  }
}
