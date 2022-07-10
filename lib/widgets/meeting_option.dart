import 'package:flutter/material.dart';
import 'package:talk_flutter_app/utils/app_colors.dart';

class MeetingOption extends StatelessWidget {
  const MeetingOption({Key? key, required this.text, required this.isMute, required this.onChange}) : super(key: key);

  final String text;
  final bool isMute;
  final Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Switch(value: isMute, onChanged: onChange, activeColor: AppColors.buttonColor,)
        ],
      ),
    );
  }
}
