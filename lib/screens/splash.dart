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
    await Future.delayed(Duration(milliseconds: 2500),() {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 26, 7, 197), Color.fromARGB(255, 6, 218, 144)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 80, color: Colors.white),
            SizedBox(height: 20),
            Text('Splash Screen', style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontSize: 32
            ))
          ],
        ),
      ),
    );
  }
}
