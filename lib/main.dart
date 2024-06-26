import 'package:acm_task_app/homepage.dart';
import 'package:acm_task_app/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

String? userName, userEmail, userProfilePic;

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly'
]);

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: dotenv.env['apiKey']!,
          appId: dotenv.env['appId']!,
          messagingSenderId: dotenv.env['messagingSenderId']!,
          projectId: dotenv.env['projectId']!));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (snapshot.hasData) {
              return HomePage(user: snapshot.data!);
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text('Sign In page'),
                  centerTitle: true,
                ),
                body: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        print('Sign in button pressed!');
                        handleSignIn(context);
                      },
                      child: Text('Sign in with Google')),
                ),
              );
            }
          }
        });
  }

  Future<void> handleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication? googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        userName = userCredential.user!.displayName;
        userEmail = userCredential.user!.email;
        userProfilePic = userCredential.user!.photoURL;

        print('User Name: $userName');
        print('User Email: $userEmail');

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(user: userCredential.user!)));
      }
    } catch (e) {
      print('Error signing in: $e');
    }
  }
}
