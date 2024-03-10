import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/views/home_view.dart';

import '../../cubits/checking_connexion/checking_connexion_cubit.dart';
import 'offline_widget.dart';

class HomeCheckerConnexion extends StatefulWidget {
  const HomeCheckerConnexion({super.key});

  @override
  State<HomeCheckerConnexion> createState() => _HomeCheckerConnexionState();
}

class _HomeCheckerConnexionState extends State<HomeCheckerConnexion> {
  @override
  void initState() {
    BlocProvider.of<CheckingConnexionCubit>(context).trackInternetConnexion();
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<CheckingConnexionCubit>(context).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckingConnexionCubit, CheckingConnexionState>(
      builder: (context, state) {
        if (state is ThereIsInternetConnexion) {
          return const HomeView();
        } else {
          return const OfflineWidget();
        }
      },
    );
  }
}
