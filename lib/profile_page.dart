import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  final User user;
  
  const ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/profile_page_background.jpg'),
          fit: BoxFit.cover)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
              ),
              SizedBox(height: 20,),
              Text('${user.displayName}', style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text('${user.email}', style: TextStyle(fontWeight: FontWeight.w600),)
            ],
          )),
      ),
    );
  }
}
