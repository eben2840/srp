import 'package:flutter/material.dart';
import 'package:srp/Account/Signup.dart';
import 'package:srp/Homepage/HomepageScreen.dart';
import 'package:srp/Widget/CustomRichText.dart';
import 'package:srp/Widget/CustomSnackBar.dart';
import 'package:srp/dashboardBottom/Dashboard.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Account/Login.dart';
import 'package:http/http.dart' as http;

class Skipscreen extends StatefulWidget {
  const Skipscreen({super.key});

  @override
  _SkipscreenState createState() => _SkipscreenState();
}

class _SkipscreenState extends State<Skipscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;



  Future<void> loginUser(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      CustomSnackBar.showErrorSnackBar(
        context,
        'Please fill in all fields',
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });

    // Logic for successful login should be placed here if needed
  }

  ElevatedButton _buildButton({
    required String text,
    required VoidCallback onPressed,
    required Color backgroundColor,
    required Color textColor,
    required String iconPath,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20.0),
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        minimumSize: const Size(double.infinity, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        textStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, width: 20, height: 20, fit: BoxFit.cover),
          const SizedBox(width: 8),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  
  void _launchURL(String url) async {
    final Uri uri = Uri.parse('$url');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Could not launch $url');
      throw 'Could not launch $url';
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.network(
              'https://central.edu.gh/static/img/about2.jpeg',
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          // Foreground Content
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/Central-Uni-logo (1).png',
                        width: 100, 
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: _buildButton(
                        text: 'Log Into Account ',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        iconPath: 'assets/icons/user-trust.png',
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left:10, right: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              height: 10,
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Or',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 165, 164, 164)),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              height: 10,
                              color: Colors.grey,
                              thickness: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                   
                    const SizedBox(height: 10),
                    _buildButton(
                      text: 'Reset My Password',
                      onPressed: () {
                      // _launchURL('student.central.edu.gh/confirmemail');
                       _launchURL('https://vendor.aftahrs.com');
                      },
                      backgroundColor: Color.fromARGB(255, 1, 1, 1),
                      textColor: Colors.white,
                      iconPath: 'assets/icons/member-list.png',
                    ),
                    
                    const SizedBox(height: 30),
                    CustomRichText(
                      subtitle: ' Help Center',
                      title: 'Need Help Signing Up?',
                      subtitleTextStyle: TextStyle(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                      onTab: () {
                       
                      },
                    ),
                       const SizedBox(height:40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
