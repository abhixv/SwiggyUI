import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:swiggy_ui/views/mobile/login/login_page_helper.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool valuefirst = false;
  final phoneNumberController = TextEditingController();

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
            Provider.of<LoginPageHelper>(context, listen: false)
                .phoneNumberTextField(context, phoneNumberController),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Provider.of<LoginPageHelper>(context, listen: false)
                .loginButton(context, phoneNumberController, valuefirst),
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
                Provider.of<LoginPageHelper>(context, listen: false)
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
