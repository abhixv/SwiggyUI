import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:swiggy_ui/constants.dart';
import 'package:swiggy_ui/views/mobile/home_bottom_navigation_screen.dart';

class Authentication with ChangeNotifier {
  Future<void> login(
      TextEditingController phoneNumberController, BuildContext context) async {
    if (phoneNumberController.text.length == 10) {
      try {
        var url = Uri.parse('https://$baseUrl/api/users/auth/sendOTP');
        var response = await http.post(url,
            body: ({
              'phoneCode': '+91',
              'phoneNumber': phoneNumberController.text
            }));
        if (response.statusCode == 200) {
          print(response.body);
          Navigator.push(
              context,
              PageTransition(
                  child: const HomeBottomNavigationScreen(),
                  type: PageTransitionType.fade));
        }
      } catch (e) {
        print(e);
      }
    } else {}
  }
}
