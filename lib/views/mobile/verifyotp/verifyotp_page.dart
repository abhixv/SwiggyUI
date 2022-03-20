import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:swiggy_ui/views/mobile/login/login_page_helper.dart';
import 'package:provider/provider.dart';
import 'package:swiggy_ui/views/mobile/verifyotp/verifyotp_page_helper.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({Key? key, required this.phoneController})
      : super(key: key);
  final TextEditingController phoneController;

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  bool valuefirst = false;
  final otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Provider.of<VerifyOtpPageHelper>(context, listen: false)
                .otpTextField(context, otpController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Provider.of<VerifyOtpPageHelper>(context, listen: false)
                .verifyButton(context, otpController, widget.phoneController),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  fillColor: MaterialStateProperty.all(Colors.black),
                  checkColor: Colors.white,
                  activeColor: Colors.orange,
                  value: valuefirst,
                  onChanged: (value) {
                    setState(() {
                      valuefirst = value!;
                    });
                  },
                ),
                Provider.of<VerifyOtpPageHelper>(context, listen: false)
                    .checkPrivacyText(context),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
