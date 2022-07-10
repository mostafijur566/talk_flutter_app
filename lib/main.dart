import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:talk_flutter_app/pages/auth/login_page.dart';
import 'package:talk_flutter_app/pages/home/home_page.dart';
import 'package:talk_flutter_app/pages/video/video_page.dart';
import 'package:talk_flutter_app/resourses/auth_method.dart';
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

      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/video': (context) => const VideoPage(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder:(context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData){
            return HomePage();
          }
          return LoginPage();

        },
      )
    );
  }
}

