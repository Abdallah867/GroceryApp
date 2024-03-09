import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/widgets/profile/menu_widget.dart';
import 'package:grocery_app/widgets/profile/use_info_widget.dart';

import 'logout_button.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserInfoWidget(
          email: user.email,
          username: user.name,
        ),
        const MenuWidget(icon: Icons.shopping_cart_outlined, name: 'My Cart'),
        const MenuWidget(
            icon: Icons.favorite_border_outlined, name: 'My Favorites'),

        const MenuWidget(icon: Icons.shopping_bag_outlined, name: 'Orders'),
        // const MenuWidget(icon: Icons.location_pin, name: 'Delivery Address'),
        const MenuWidget(
            icon: Icons.credit_card_outlined, name: 'Payment Methods'),
        const MenuWidget(icon: Icons.discount_outlined, name: 'Promo Codes'),
        const MenuWidget(
            icon: Icons.notifications_none_outlined, name: 'Notifications'),
        // const MenuWidget(icon: Icons.help_outline, name: 'Help'),
        const MenuWidget(icon: Icons.info_outline, name: 'About'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
          child: const LogoutButton(),
        )
      ],
    );
  }
}
