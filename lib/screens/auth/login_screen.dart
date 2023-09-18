import 'package:flutter/material.dart';

import '../../utils/color_pallete.dart';

class CustomSocialLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth < 600 ? screenWidth - 40.0 : 400.0;

  final Shader iphoneShader =
      const LinearGradient(colors: [Color(0xff070D14), Color(0xff85D1EE)])
          .createShader(const Rect.fromLTWH(0, 100, 50, 2));

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: CustomColor.primaryGradient
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/health.png'), 
                backgroundColor: CustomColor.secondaryColor,
              ),
              const SizedBox(height: 20.0),
              Text(
                'Welcome to MemoryNest App',
                style: TextStyle(
                  foreground: Paint()..shader = iphoneShader,
                  shadows:  const [
                    Shadow(
                        offset: Offset(10, 10),
                        blurRadius: 20,
                        color: Colors.black),
                    Shadow(
                        offset: Offset(10, 10),
                        blurRadius: 20,
                        color: Colors.black12),
                  ],
                  fontSize: 24.0,
                  // color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
                width: buttonWidth, // Responsive button width
                height: 50.0, 
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Google Sign-In Logic
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        'assets/google.png', 
                        height: 30.0,
                      ),
                      const SizedBox(width: 20.0),
                      const Text(
                        'Sign in with Google    ',
                        style: TextStyle(fontSize: 16.0, color:  Color(0xFF180D41)),
                        
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: buttonWidth, // Responsive button width
                height: 50.0, 
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Facebook Sign-In Logic
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                        'assets/facebook.png', 
                        height: 30.0,
                      ),
                      const SizedBox(width: 20.0),
                      const Text(
                        'Sign in with Facebook',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
