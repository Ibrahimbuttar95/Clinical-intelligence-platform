Health Assessment
Voice Assessment
History
Profile
Subscription
Language Switch
import 'package:flutter/material.dart';

import 'triage_screen.dart';
import 'voice_screen.dart';
import 'history_screen.dart';
import 'profile_screen.dart';
import 'subscription_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Clinical Intelligence",
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,

          children: [

            _card(
              context,
              "Health Assessment",
              Icons.health_and_safety,
              const TriageScreen(),
            ),

            _card(
              context,
              "Voice Assessment",
              Icons.mic,
              const VoiceScreen(),
            ),

            _card(
              context,
              "History",
              Icons.history,
              const HistoryScreen(),
            ),

            _card(
              context,
              "Profile",
              Icons.person,
              const ProfileScreen(),
            ),

            _card(
              context,
              "Subscription",
              Icons.workspace_premium,
              const SubscriptionScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _card(
    BuildContext context,
    String title,
    IconData icon,
    Widget screen,
  ) {

    return InkWell(

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => screen,
          ),
        );
      },

      child: Card(
        elevation: 4,

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            Icon(
              icon,
              size: 50,
            ),

            const SizedBox(
              height: 12,
            ),

            Text(
              title,
              textAlign:
                  TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
