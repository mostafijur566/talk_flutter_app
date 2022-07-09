import 'package:flutter/material.dart';
import 'package:talk_flutter_app/utils/app_colors.dart';

class HomePageButton extends StatelessWidget {
  const HomePageButton({Key? key, required this.onPressed, required this.icon, required this.text}) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            // width: 60,
            // height: 60,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Icon(icon, color: Colors.white, size: 30,),
            decoration: BoxDecoration(
              color: AppColors.buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.06),
                  offset: const Offset(0, 4),
                )
              ]
            ),
          ),
          SizedBox(height: 10,),
          Text(text,
            style: TextStyle(
              color: Colors.grey,

            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
