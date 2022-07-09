import 'package:flutter/material.dart';
import 'package:talk_flutter_app/utils/app_colors.dart';

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
