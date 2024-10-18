import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ydione_plant_app/ui/screens/widgets/custom_textfield.dart';

import '../../constants.dart';
import '../root_page.dart';
import '../signin_page.dart';
import '../signup_page.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/reset-password.png'),
            const Text(
              'Reset Password',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              icon: Icons.alternate_email,
              obsecureText: false,
              hintText: 'Enter Username',
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const RootPage(),
                      type: PageTransitionType.bottomToTop),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: const Center(
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: const SignIn(),
                      type: PageTransitionType.bottomToTop),
                );
              },
              child: Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Have an account? ',
                    style: TextStyle(
                      color: Constants.blackColor,
                    ),
                  ),
                  TextSpan(
                    text: 'Sign In here',
                    style: TextStyle(
                      color: Constants.primaryColor,
                    ),
                  ),
                ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
