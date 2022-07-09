import 'package:flutter/material.dart';
import 'package:talk_flutter_app/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onTap}) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: AppColors.buttonColor,
              minimumSize: Size(
                double.maxFinite,
                50,
              ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: AppColors.buttonColor)
            )
          ),

      ),
    );
  }
}
