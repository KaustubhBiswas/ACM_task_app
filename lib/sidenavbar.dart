import 'package:acm_task_app/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SideNavBar extends StatefulWidget {

  final User user;

  const SideNavBar({required this.user});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {

    final firstName = widget.user.displayName!.split(' ')[0];

    return Drawer(
      width: 240,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(74),
          bottomRight: Radius.circular(74),
        )
      ),
      backgroundColor: Colors.blue,
      child: Stack(
          children: [
            Positioned(
              top: 100,
              left: 73.83,
              child: Icon(
                Icons.account_circle,
                size: 75,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 190,
              left: 63,
              child: Text(
                firstName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 261),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400),
                      ),
                      onTap: () {
                        print('Home Button Pressed');
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.mail,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Inbox',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400),
                      ),
                      onTap: () {
                        print('Inbox Button Pressed');
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      title: Text(
                        'Important',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400),
                      ),
                      onTap: () {
                        print('Important Button Pressed');
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400),
                      ),
                      onTap: () {
                        print('Settings Button Pressed');
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Sign Out',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400),
                      ),
                      onTap: () {
                        print('Sign Out Button Pressed');
                        FirebaseAuth.instance.signOut();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => SignInPage())));
                      },
                    ),
                  ],
                ))
          ],
        )
    );
  }
}