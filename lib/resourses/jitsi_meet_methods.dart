import 'package:flutter/cupertino.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:talk_flutter_app/resourses/auth_method.dart';

class JitsiMeetMethods{

  final AuthMethods _authMethods = AuthMethods();

  void createMeeting({required String roomName, required bool isAudioMuted, required bool isVideoMuted}) async{
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(
        room: roomName
      )
        ..userDisplayName = _authMethods.user.displayName
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL // or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}