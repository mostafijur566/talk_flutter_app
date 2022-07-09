import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talk_flutter_app/pages/auth/login_page.dart';
import 'package:talk_flutter_app/utils/app_colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(

        scaffoldBackgroundColor: AppColors.backgroundColor
      ),
      home: const LoginPage()
    );
  }
}
