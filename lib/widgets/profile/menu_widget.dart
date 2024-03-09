import 'package:flutter/material.dart';
import 'package:grocery_app/views/favourite_view.dart';
import 'package:grocery_app/widgets/profile/help_page.dart';

import '../../views/cart_view.dart';
import 'about_page.dart';
import 'profile_details.dart';

class MenuWidget extends StatelessWidget {
  final IconData icon;
  final String name;
  const MenuWidget({
    super.key,
    required this.icon,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            switch (name) {
              case 'My Cart':
                return const CartView();
              case 'My Favorites':
                return const FavouriteView();
              case 'About':
                return const AboutPage();
              case 'Help':
                return const HelpPage();
              default:
                return ProfileDetails(menuName: name);
            }
          }),
        );
      },
      child: ListTile(
        shape: const Border.symmetric(
            horizontal: BorderSide(color: Color(0xFFE2E2E2))),
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(name),
        trailing: const Icon(Icons.arrow_forward_ios),
        minVerticalPadding: 20.0,
      ),
    );
  }
}
