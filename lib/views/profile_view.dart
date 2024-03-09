import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:grocery_app/custom_app_bar.dart';
import 'package:grocery_app/loading_widget.dart';
import '../widgets/profile/profile_list_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).getUserInformations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Profile'),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is GetUserLoading) {
            return const LoadingWidget();
          } else if (state is UserFetched) {
            return ProfileListView(
              user: BlocProvider.of<AuthCubit>(context).userInfo,
            );
          } else {
            return const Text('An Error occured, please check your connexion');
          }
        },
      ),
    );
  }
}
