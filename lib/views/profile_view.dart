import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/cubits/cubit/profile_cubit_cubit.dart';
import 'package:grocery_app/custom_app_bar.dart';
import 'package:grocery_app/loading_widget.dart';
import '../widgets/profile/profile_list_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Profile'),
      body: BlocConsumer<ProfileCubitCubit, ProfileCubitState>(
        listener: (context, state) {
          // if (state is LogoutSuccess) {
          //   Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: ((context) => const SignUpView()),
          //       ));
          //   // BlocProvider.of<CheckUserIfExistsCubit>(context).getUserIfExists();
          // }
        },
        builder: (context, state) {
          if (state is GetUserLoading) {
            return const LoadingWidget();
          } else if (state is UserFetched) {
            return ProfileListView(
              user: BlocProvider.of<ProfileCubitCubit>(context).userInfo,
            );
          } else {
            return const Text('An Error occured, please check your connexion');
          }
        },
      ),
    );
  }
}
