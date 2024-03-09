import 'package:flutter/material.dart';
import 'package:grocery_app/custom_app_bar.dart';

class ProfileDetails extends StatelessWidget {
  final String menuName;
  const ProfileDetails({super.key, required this.menuName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(menuName),
      body: Center(
        child: Text('You don\'t have any $menuName'),
      ),
    );
  }
}
