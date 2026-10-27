import 'package:flutter/material.dart';
import 'package:srp/Widget/CustomRichText.dart';
import 'package:srp/dashboardBottom/Dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  bool _obscureText = true;

  // Future<void> loginUser(BuildContext context) async {
  //   if (emailController.text.isEmpty || passwordController.text.isEmpty) {
  //     CustomSnackBar.showErrorSnackBar(
  //       context,
  //       'Please fill in all fields',
  //     );
  //     return;
  //   }

  //   setState(() {
  //     isLoading = true;
  //   });

  //   await Future.delayed(Duration(seconds: 2));

  //   bool success = await ApiService.login(
  //     emailController.text,
  //     passwordController.text,
  //   );

  //   setState(() {
  //     isLoading = false;
  //   });

  //   if (success) {
  //     //save user login token
  //     String token = await ApiService.getAuthToken();

  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.setString('authToken', token);

  //     CustomSnackBar.showSuccessSnackBar(
  //       context,
  //       'Login successful! Welcome back.',
  //     );
  //     Navigator.pushReplacement(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => DashboardPage()), 
  //               );
  //   } else {
  //     CustomSnackBar.showErrorSnackBar(
  //       context,
  //       'Login failed. Please try again.',
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 0, 0, 0),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: 
           SingleChildScrollView(
              padding: EdgeInsets.all(30.0),
              child: Container(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network('https://central.edu.gh/static/img/Central-Uni-logo.png',
                    width: 200,
                    ),
                    SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    //     Text(
                    //   'Email',
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     fontWeight: FontWeight.bold,
                    //     color: Color.fromARGB(255, 0, 0, 0),
                    //   ),
                    // ),
                    SizedBox(height: 5,),
                        TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'aftahours@gmail.com',
                            // add border radius
                            filled: true,
                            hintStyle: TextStyle(
                              fontFamily: 'Title',
                              fontSize: 16.0,
                            ),
                            fillColor: Color.fromARGB(255, 255, 253, 253),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 16.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30)), 
                              borderSide: BorderSide(color: Color.fromARGB(255, 236, 235, 235))
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            hintText: '************',
                            filled: true,
                            hintStyle: const TextStyle(
                              fontFamily: 'Title',
                              fontSize: 16.0,
                            ),
                             fillColor: Color.fromARGB(255, 255, 253, 253),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 16.0),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(30)), 
                              borderSide: BorderSide(color: Color.fromARGB(255, 236, 235, 235))
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: _obscureText
                                  ? const Icon(Icons.visibility_off,
                                      color: Color(0xFF868686))
                                  : const Icon(Icons.visibility,
                                      color: Color(0xFF868686)),
                            ),
                          ),
                          // obscureText: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardPage(),
                            ),
                          );
                      },
                      child: const Text('Forgot Password?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            decoration: TextDecoration.underline,
                            // fontStyle: FontStyle.italic,
                          )),
                    ),
                  ],
                ),
              ),
            ),
       bottomNavigationBar: 
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                        onPressed: isLoading
                            ? null 
                            : () async {
                                setState(() {
                                  isLoading = true;
                                });
                              },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20.0),
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          foregroundColor:
                              const Color.fromARGB(255, 253, 252, 252),
                          minimumSize: const Size(double.infinity, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Log Into Account',
                              ),
                      ),
            ),
                    
    );
  }
}


