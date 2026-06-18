import 'package:flutter/material.dart';

import 'login_screen.dart';

class OnboardingScreen
extends StatelessWidget {

const OnboardingScreen({
super.key,
});

@override
Widget build(BuildContext context) {

return Scaffold(

  body: Padding(
    padding:
        const EdgeInsets.all(24),

    child: Column(

      mainAxisAlignment:
          MainAxisAlignment.center,

      children: [

        const Icon(
          Icons.health_and_safety,
          size: 100,
        ),

        const SizedBox(
          height: 20,
        ),

        const Text(
          "Clinical Intelligence Platform",
          textAlign:
              TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        const Text(
          "AI-powered clinical assessment, voice analysis and medical intelligence.",
          textAlign:
              TextAlign.center,
        ),

        const SizedBox(
          height: 40,
        ),

        ElevatedButton(
          onPressed: () {

            Navigator.pushReplacement(
              context,

              MaterialPageRoute(
                builder: (_) =>
                    const LoginScreen(),
              ),
            );
          },

          child:
              const Text(
            "Get Started",
          ),
        ),
      ],
    ),
  ),
);

}
}
