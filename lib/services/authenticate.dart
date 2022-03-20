import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'package:swiggy_ui/constants.dart';
import 'package:swiggy_ui/models/auth/verifyotp_model.dart';
import 'package:swiggy_ui/views/mobile/home_bottom_navigation_screen.dart';
import 'package:swiggy_ui/views/mobile/verifyotp/verifyotp_page.dart';

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
                  child: VerifyOtpPage(
                    phoneController: phoneNumberController,
                  ),
                  type: PageTransitionType.fade));
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<VerifyOtp> verifyOtp(TextEditingController otpController,
      TextEditingController phoneNumberController, BuildContext context) async {
    var verifyOtp = null;
    if (otpController.text.isNotEmpty) {
      try {
        var url = Uri.parse('https://$baseUrl/api/users/auth/verifyOTP');
        var response = await http.post(url,
            body: ({
              'phoneCode': '+91',
              'phoneNumber': phoneNumberController.text,
              'otp': otpController.text
            }));
        if (response.statusCode == 200) {
          print(response.body);
          var jsonString = response.body;
          var jsonMap = json.decode(jsonString);
          verifyOtp = VerifyOtp.fromJson(jsonMap);

          Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.leftToRight,
                  child: const HomeBottomNavigationScreen()));
          return verifyOtp;
        }
      } catch (e) {
        print(e);
      }
    }
    return verifyOtp;
  }
}
