import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_ui/services/authenticate.dart';
import 'package:swiggy_ui/views/mobile/home_bottom_navigation_screen.dart';

class VerifyOtpPageHelper with ChangeNotifier {
  double textFontSize = 14;

  RichText checkPrivacyText(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'I agree to the ',
        style: TextStyle(
          color: Colors.black,
          fontSize: textFontSize - 3,
        ),
        children: <TextSpan>[
          TextSpan(
            recognizer: TapGestureRecognizer(),
            text: 'terms of service ',
            style: TextStyle(
              color: Colors.black,
              fontSize: textFontSize - 3,
            ),
          ),
          TextSpan(
            text: 'and ',
            style: TextStyle(
              color: Colors.black,
              fontSize: textFontSize - 3,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer(),
            text: 'privacy policy',
            style: TextStyle(
              color: Colors.black,
              fontSize: textFontSize - 3,
            ),
          )
        ],
      ),
    );
  }

  Container otpTextField(
      BuildContext context, TextEditingController otpController) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: TextField(
            controller: otpController,
            style: TextStyle(
              fontSize: textFontSize,
              color: Colors.white,
            ),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                hintText: "Enter OTP",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }

  Widget verifyButton(BuildContext context, TextEditingController otpController,
      TextEditingController phoneNumberController) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        Provider.of<Authentication>(context, listen: false)
            .verifyOtp(otpController, phoneNumberController, context);
        // Navigator.push(
        //     context,
        //     PageTransition(
        //         child: const HomeBottomNavigationScreen(),
        //         type: PageTransitionType.fade));

        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //     backgroundColor: Colors.white,
        //     content: Text(
        //       'Please agree Privacy Policy',
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: textFontSize - 2,
        //       ),
        //     )));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            "Verify Login",
            style: TextStyle(
              color: Colors.white,
              fontSize: textFontSize,
            ),
          ),
        ),
      ),
    );
  }

  logoText() {
    return RichText(
      text: TextSpan(
        text: 'Shift',
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'it',
            style: TextStyle(
              color: Colors.black,
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }

  logoTitleText() {
    return RichText(
      text: TextSpan(
        text: 'Your Package,',
        style: TextStyle(
          color: Colors.white,
          fontSize: textFontSize,
        ),
        children: <TextSpan>[
          TextSpan(
            text: ' Our Responsibility',
            style: TextStyle(
              color: Colors.black,
              fontSize: textFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
