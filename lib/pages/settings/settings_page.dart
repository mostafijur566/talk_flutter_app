import 'package:flutter/material.dart';
import 'package:talk_flutter_app/utils/app_colors.dart';
import 'package:talk_flutter_app/widgets/settings_widget.dart';

import '../../resourses/auth_method.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final AuthMethods _authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(_authMethods.user.photoURL!),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          _authMethods.user.displayName!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SettingsWidget(
            text: _authMethods.user.email!, icon: Icons.email_outlined),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: (){
            AuthMethods().signOut();
          },
          child: SettingsWidget(
            text: 'Log Out',
            icon: Icons.logout_outlined,
            textColor: AppColors.logoutColor,
            iconColor: AppColors.logoutColor,
          ),
        ),
      ],
    );
  }
}
