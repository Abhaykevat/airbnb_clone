import 'package:airbnb_clone/view/guestScreens/account_screen.dart';
import 'package:airbnb_clone/view/guestScreens/explore_screen.dart';
import 'package:airbnb_clone/view/guestScreens/inbox_screen.dart';
import 'package:airbnb_clone/view/guestScreens/saved_listings_screen.dart';
import 'package:airbnb_clone/view/guestScreens/trips_screen.dart';
import 'package:airbnb_clone/view/hostScreens/bookings_screen.dart';
import 'package:airbnb_clone/view/hostScreens/my_postings_screen.dart';
import 'package:flutter/material.dart';
class HostHomeScreen extends StatefulWidget
{
  int? index;
  HostHomeScreen({super.key,this.index,});

  @override
  State<HostHomeScreen> createState() => _HostHomeScreenState();
}

class _HostHomeScreenState extends State<HostHomeScreen>
{
  int selectedIndex=0;
  final List<String> screenTitles=[
    "Bookings",
    "MyPostings",
    "Inbox",
    "Profile"
  ];
  final List<Widget> screens=[
    BookingScreen(),
    MyPostingsScreen(),
    InboxScreen(),
    AccountScreen()

  ];
  BottomNavigationBarItem customNavigationBarItem(int index,IconData iconData,String title)
  {
    return BottomNavigationBarItem(
        icon: Icon(
          iconData,
          color: Colors.black,
        ),
        activeIcon: Icon(
          iconData,
          color: Colors.pink,
        ),
        label: title
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex=widget.index ?? 3;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i){
          setState(() {
            selectedIndex=i;
          });
        },
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>
        [
          customNavigationBarItem(0,Icons.calendar_today,screenTitles[0]),
          customNavigationBarItem(1,Icons.home,screenTitles[1]),
          customNavigationBarItem(2,Icons.message,screenTitles[2]),
          customNavigationBarItem(3,Icons.person_outline,screenTitles[3]),

        ],
      ),
    );
  }
}
