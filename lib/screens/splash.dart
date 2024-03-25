import 'package:acm_task_app/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }


  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        child: Text('Splash Screen'),
      )),
    );
  }
}
