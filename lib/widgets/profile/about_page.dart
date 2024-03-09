import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/custom_app_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('About'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/logo.svg'),
            const SizedBox(
              width: double.infinity,
            ),
            const Text(
              'Grocery App',
              style: TextStyle(fontSize: 21),
            ),
            const SizedBox(
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  '📱 Our app today and experience the future of grocery shopping! With our user-friendly interface and extensive product selection, you can shop conveniently from the comfort of your home or on the go. Save time and money by avoiding long queues and traffic jams at the supermarket. 🚗💨'),
            ),
            const Spacer(),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Developed by Abdallah Mohellebi',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Contact me:'),
                Text('abdallah.mohellebi@g.enp.edu.dz'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
