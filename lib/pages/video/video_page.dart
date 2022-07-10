import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:talk_flutter_app/resourses/auth_method.dart';
import 'package:talk_flutter_app/resourses/jitsi_meet_methods.dart';
import 'package:talk_flutter_app/utils/app_colors.dart';
import 'package:talk_flutter_app/widgets/custom_button.dart';
import 'package:talk_flutter_app/widgets/meeting_option.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  final AuthMethods _authMethods = AuthMethods();

  late TextEditingController meetingIdController;
  late TextEditingController nameController;

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    super.initState();
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
  }

  @override
  void dispose(){
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting(){
    _jitsiMeetMethods.createMeeting(roomName: meetingIdController.text, isAudioMuted: isAudioMuted, isVideoMuted: isVideoMuted, name: nameController.text);
  }

  @override
  Widget build(BuildContext context) {

    onAudioMuted(bool val){
      setState(() {
        isAudioMuted = val;
      });
    }

    onVideoMuted(bool val){
      setState(() {
        isVideoMuted = val;
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Join a Meeting',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          TextField(
            controller: meetingIdController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              fillColor: AppColors.secondaryBackgroundColor,
              filled: true,
              border: InputBorder.none,
              hintText: 'Room ID',
              contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: nameController,
            maxLines: 1,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                fillColor: AppColors.secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(text: 'Join', onTap: _joinMeeting),
          SizedBox(
            height: 20,
          ),
          
          MeetingOption(text: "Don't connect to Audio", isMute: isAudioMuted, onChange: onAudioMuted,),
          MeetingOption(text: "Turn off my Video", isMute: isVideoMuted, onChange: onVideoMuted,),
        ],
      ),
    );
  }
}
