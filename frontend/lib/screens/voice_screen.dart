import 'package:flutter/material.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() =>
      _VoiceScreenState();
}

class _VoiceScreenState
    extends State<VoiceScreen> {

  bool listening = false;

  String transcript =
      "Voice transcript appears here";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Voice Assessment",
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          children: [

            Card(
              child: Padding(
                padding:
                    const EdgeInsets.all(
                        20),

                child: Text(
                  transcript,
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            FloatingActionButton(
              onPressed: () {

                setState(() {

                  listening =
                      !listening;
                });
              },

              child: Icon(
                listening
                    ? Icons.stop
                    : Icons.mic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
