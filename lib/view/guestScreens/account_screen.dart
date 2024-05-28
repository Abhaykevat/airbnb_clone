import 'package:airbnb_clone/global.dart';
import 'package:airbnb_clone/model/app_constants.dart';
import 'package:airbnb_clone/view/guest_home_screen.dart';
import 'package:airbnb_clone/view/host_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
{
  String _hostingTitle='Show My Host dashboard';
  modifyHostingMode() async
  {
    if(AppConstants.currentUser.isHost!)
      {
        if(AppConstants.currentUser.isCurrentlyHosting!)
          {
            AppConstants.currentUser.isCurrentlyHosting=false;
            Get.to(GuestHomeScreen());
          }
        else
        {
          AppConstants.currentUser.isCurrentlyHosting=true;
          Get.to(HostHomeScreen());
        }
      }
    else
    {
      await userViewModel.becomeHost(FirebaseAuth.instance.currentUser!.uid);
      AppConstants.currentUser.isCurrentlyHosting=true;
      Get.to(HostHomeScreen());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(AppConstants.currentUser.isHost!)
    {
      if(AppConstants.currentUser.isCurrentlyHosting!)
      {
        _hostingTitle='Show my Host Dashboard';
      }
      else
      {
        _hostingTitle='Show my Host Dashboard';
      }
    }
    else
    {
      _hostingTitle='Become a Host';

    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 50, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(bottom: 30.0),
              child: Center(
                child: Column(children: [
                  MaterialButton(
                    onPressed: (){},
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: MediaQuery.of(context).size.width /4.5,
                      child: CircleAvatar(
                        backgroundImage: AppConstants.currentUser.displayImage,
                        radius: MediaQuery.of(context).size.width /4.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppConstants.currentUser.getFullNameOfUser(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        AppConstants.currentUser.email.toString(),
                        style: TextStyle(

                          fontSize: 15,
                        ),
                      )
                    ],
                  )
                ],),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.pinkAccent,
                        Colors.amber,
                      ],
                      // begin: FractionalOffset(0.0,1.0),
                      // end: FractionalOffset(1.0,0.0),
                      // stops: [1.0,0.0],
                      tileMode: TileMode.clamp
                    )
                  ),
                  child: MaterialButton(
                    height: MediaQuery.of(context).size.height/9.1,
                    onPressed: (){},
                    child:const  ListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      leading: Text("personal Information",style: TextStyle(fontSize: 18.5,fontWeight: FontWeight.normal),
                      ),
                      trailing: Icon(Icons.person_2,size: 34,),
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.pinkAccent,
                            Colors.amber,
                          ],
                          // begin: FractionalOffset(0.0,1.0),
                          // end: FractionalOffset(1.0,0.0),
                          // stops: [1.0,0.0],
                          tileMode: TileMode.clamp
                      )
                  ),
                  child: MaterialButton(
                    height: MediaQuery.of(context).size.height/9.1,
                    onPressed: (){
                      modifyHostingMode();

                    },
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      leading: Text(_hostingTitle,style: TextStyle(fontSize: 18.5,fontWeight: FontWeight.normal),
                      ),
                      trailing: Icon(Icons.hotel_outlined,size: 34,),
                    ),
                  ),
                ),

                SizedBox(height: 10,),

                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.pinkAccent,
                            Colors.amber,
                          ],
                          // begin: FractionalOffset(0.0,1.0),
                          // end: FractionalOffset(1.0,0.0),
                          // stops: [1.0,0.0],
                          tileMode: TileMode.clamp
                      )
                  ),
                  child: MaterialButton(
                    height: MediaQuery.of(context).size.height/9.1,
                    onPressed: (){},
                    child:const  ListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      leading: Text("Log out",style: TextStyle(fontSize: 18.5,fontWeight: FontWeight.normal),
                      ),
                      trailing: Icon(Icons.logout_sharp,size: 34,),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



