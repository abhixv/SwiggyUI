import 'package:flutter/material.dart';
import 'package:swiggy_ui/views/mobile/home_bottom_navigation_screen.dart';
import 'package:swiggy_ui/views/mobile/login/login_page.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
