import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FirestoreMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory => _firestore.collection('users').doc(_auth.currentUser!.uid).collection('meetings').snapshots();

  void addToMeetingHistory(String meetingName) async{
    try{
      print('Firestore called ${_auth.currentUser!.uid}');

      await _firestore.collection('users').doc(_auth.currentUser!.uid).collection('meetings').add({
        'meetingName': meetingName,
        'createdAt': DateTime.now(),
      });
    }
    catch(e){
      Get.snackbar('Oops!', e.toString());
    }
  }
}