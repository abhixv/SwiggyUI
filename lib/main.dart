import 'package:flutter/material.dart';
import 'package:swiggy_ui/services/authenticate.dart';
import 'package:swiggy_ui/views/mobile/login/login_page_helper.dart';
import 'package:swiggy_ui/views/mobile/verifyotp/verifyotp_page_helper.dart';
import 'package:swiggy_ui/views/tab_desktop/tab_screen.dart';
import 'package:provider/provider.dart';
import 'shared/app_theme.dart';
import 'views/tab_desktop/desktop_screen.dart';
import 'views/mobile/mobile_screen.dart';
import 'widgets/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginPageHelper()),
        ChangeNotifierProvider(create: (_) => Authentication()),
        ChangeNotifierProvider(create: (_) => VerifyOtpPageHelper()),
      ],
      child: MaterialApp(
        title: 'SwiggyUI',
        debugShowCheckedModeBanner: false,
        theme: appPrimaryTheme(),
        home: const Responsive(
          mobile: MobileScreen(),
          tablet: TabScreen(),
          desktop: DesktopScreen(),
        ),
      ),
    );
  }
}
