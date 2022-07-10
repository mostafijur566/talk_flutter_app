import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({Key? key, required this.text, required this.icon, this.iconColor, this.textColor}) : super(key: key);

  final String text;
  final IconData icon;
  final Color ? iconColor;
  final Color ? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
          color: AppColors.navBarColor,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor,),
          SizedBox(width: 10,),
          Flexible(
            child: Text(text,
              style: TextStyle(
                fontSize: 18,
                color: textColor
              ),
            ),
          )
        ],
      ),
    );
  }
}
