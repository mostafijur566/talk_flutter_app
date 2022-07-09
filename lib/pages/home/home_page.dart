import 'package:flutter/material.dart';
import 'package:talk_flutter_app/utils/app_colors.dart';
import 'package:talk_flutter_app/widgets/home_page_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _page = 0;

  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        title: const Text('Meet & Chat'),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
      ),

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageButton(
                onPressed: (){},
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
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.navBarColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[600],
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.comment_bank,
              ),
              label: 'Meet & Chat'
          ),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.lock_clock,
              ),
              label: 'Meetings'
          ),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'Contacts'
          ),

          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              label: 'Settings'
          ),
        ],
      ),
    );
  }
}
