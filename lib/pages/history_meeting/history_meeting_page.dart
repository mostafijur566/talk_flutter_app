import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talk_flutter_app/resourses/firestore_methods.dart';

class HistoryMeetingPage extends StatelessWidget {
  const HistoryMeetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirestoreMethods().meetingsHistory,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) => ListTile(
                title: Text('Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
                    style: TextStyle(fontWeight: FontWeight.bold),
              ),
                subtitle: Text(
                    'Joined on: ${DateFormat.yMMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}'
                ),
              )
          );
        });
  }
}
