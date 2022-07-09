import 'package:flutter/material.dart';
import 'package:talk_flutter_app/pages/home/home_page.dart';
import 'package:talk_flutter_app/widgets/custom_button.dart';

import '../../resourses/auth_method.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Start or join meeting',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            
            Padding(
                padding: EdgeInsets.symmetric(vertical: 38.0),
              child: Image.asset('assets/images/onboarding.png'),
            ),

            CustomButton(
                text: 'Google Sign In',
                onTap: () async{
                  bool res = await _authMethods.signInWithGoogle(context);
                  if (res) {
                    Navigator.pushNamed(context, '/home');
                  }
                },
            ),
          ],
        ),
      ),
    );
  }
}
