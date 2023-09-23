import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/color_pallete.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final Shader iphoneShader =
      const LinearGradient(colors: [Color(0xff070D14), Color(0xff85D1EE)])
          .createShader(const Rect.fromLTWH(0, 100, 50, 2));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: CustomColor.primaryGradient
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final double screenWidth = constraints.maxWidth;

            return Center(
             
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1200, // Set your maximum width here
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          'We Remember, We Empower',
                          style:  TextStyle(
                            color: const Color(0xFFE6949B),
                            fontSize: screenWidth < 600 ? 16 : 18,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Memory Nest',
                          style: TextStyle(
                            fontSize: screenWidth < 600 ? 40 : 80,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = iphoneShader,
                            shadows: const [
                              Shadow(
                                  offset: Offset(10, 10),
                                  blurRadius: 20,
                                  color: Colors.black),
                              Shadow(
                                  offset: Offset(10, 10),
                                  blurRadius: 20,
                                  color: Colors.black12),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: screenWidth < 600 ? null : 450,
                          child: Text(
                            'At MemoryNest, our mission is to enhance the well-being, independence, and quality of life of dementia patients while providing invaluable support and peace of mind to their devoted caregivers. Connect 🚀 and Save Life',
                            style: TextStyle(
                              color: const Color(0xFF4481A6),
                              fontSize: screenWidth < 600 ? 14 : 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 35),
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF21A3E2)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              InkWell(

                              child: const Icon(
                                Icons.explore,
                                color: Colors.white,
                                
                              ),
                              onTap: () => {context.go('/login')},
                              ),

                               InkWell(

                              child: const Icon(
                                Icons.hourglass_bottom_rounded,
                                color: Colors.white,
                                
                              ),
                              onTap: () => {context.go('/patient')},
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Image.asset(
                          'assets/health.png',
                          width: screenWidth < 600 ? screenWidth - 200 : 200,
                        ),
                      ],
                    ),
                  ),
                ),
              
            );
          },
        ),
      ),
    );
  }
}
