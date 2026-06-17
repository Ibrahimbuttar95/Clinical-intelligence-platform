import 'package:flutter/material.dart';
import '../voice/speech_engine.dart';
class VoiceScreen extends StatefulWidget { const VoiceScreen({super.key});
@override State createState() => _VoiceScreenState(); }
class _VoiceScreenState extends State {
final SpeechEngine speech = SpeechEngine();
bool listening = false;
String transcript = "Voice transcript appears here";
@override Widget build(BuildContext context) {
return Scaffold(

  appBar: AppBar(
    title: const Text(
      "Voice Assessment",
    ),
  ),

  body: Padding(
    padding: const EdgeInsets.all(16),

    child: Column(

      crossAxisAlignment:
          CrossAxisAlignment.stretch,

      children: [

        Card(
          child: Padding(
            padding:
                const EdgeInsets.all(20),

            child: Text(
              transcript,
              style:
                  const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 30,
        ),

        Center(
          child: FloatingActionButton(

            onPressed: () async {

              if (!listening) {

                final initialized =
                    await speech.initialize();

                if (initialized) {

                  await speech.startListening(
                    (text) {

                      setState(() {

                        transcript =
                            text;
                      });
                    },
                  );
                }

              } else {

                await speech.stopListening();
              }

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
          ),
        ),
      ],
    ),
  ),
);            Card(
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
