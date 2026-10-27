// import 'package:aftahrs/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srp/OnboardingScreen/onboardingScreen.dart';
import 'package:srp/Splashscreen/skipscreen.dart';
import 'package:srp/dashboardBottom/Dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required String title});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isFirstTime;

  @override
  void initState() {
    super.initState();
    checkFirstTimeUser();
  }



  void checkFirstTimeUser() async {
    await Future.delayed(
        Duration(seconds: 2)); 

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool('isFirstTime') ?? true;
    bool? isLoggedIn = prefs.getBool('isLoggedIn') ??
        false; 

    // print isFirstTime
    print(isFirstTime);
    // print isLoggedIn
    print(isLoggedIn);
    

    if (isFirstTime) {
      // First-time user
      prefs.setBool(
          'isFirstTime', false); 
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) =>
                Skipscreen()),
      );
      print("I am a first time user");
    } else if (isLoggedIn){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  const DashboardPage()), 
        );
        print("I am an exciting user");
      } else {

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => Skipscreen()),
        );
        print("All this didnt work");
      }
    }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Image.asset(
              'assets/images/Central-Uni-logo.png', // Replace with your splash image path
              width: 80, // Adjust the size as needed
              height: 80, // Adjust the size as needed
              fit: BoxFit.contain, // Adjust the image's fit
            ),
          ),
        ],
      ),
    );
  }
}
