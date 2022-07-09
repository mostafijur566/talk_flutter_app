import 'dart:math';

import 'package:flutter/material.dart';
import 'package:talk_flutter_app/resourses/jitsi_meet_methods.dart';

import '../../widgets/home_page_button.dart';

class MeetingPage extends StatelessWidget {
  MeetingPage({Key? key}) : super(key: key);

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async{
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomePageButton(
              onPressed: createNewMeeting,
              text: 'New\nMeeting',
              icon: Icons.videocam,
            ),

            HomePageButton(
              onPressed: (){},
              text: 'Join\nMeeting',
              icon: Icons.add_box_rounded,
            ),

            HomePageButton(
              onPressed: (){},
              text: 'Schedule\nMeeting',
              icon: Icons.calendar_today,
            ),

            HomePageButton(
              onPressed: (){},
              text: 'Share\nScreen',
              icon: Icons.arrow_upward_rounded,
            ),
          ],
        ),
        const Expanded(
            child: Center(
              child: Text(
                'Create/join Meetings with just a click!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            )
        ),
      ],
    );
  }
}