import 'package:flutter/material.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:talk_flutter_app/resourses/auth_method.dart';

import 'package:get/get.dart';
import 'package:talk_flutter_app/resourses/firestore_methods.dart';

class JitsiMeetMethods{

  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String name = ''
  }) async{

    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution.MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(
        room: roomName
      )
        ..userDisplayName = name.isEmpty ? _authMethods.user.displayName : name
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL // or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;


      _firestoreMethods.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      Get.snackbar('Oops!', error.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent
      );
    }
  }
}