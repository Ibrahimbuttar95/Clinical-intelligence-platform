import 'package:flutter/material.dart';

class TriageScreen extends StatefulWidget {
  const TriageScreen({super.key});

  @override
  State<TriageScreen> createState() =>
      _TriageScreenState();
}

class _TriageScreenState
    extends State<TriageScreen> {

  final symptomsController =
      TextEditingController();

  String result = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Health Assessment",
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller:
                  symptomsController,

              maxLines: 4,

              decoration:
                  const InputDecoration(
                border:
                    OutlineInputBorder(),

                hintText:
                    "Describe symptoms...",
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            SizedBox(
              width:
                  double.infinity,

              child:
                  ElevatedButton(

                onPressed: () async {

  final repo =
      TriageRepository();

  final response =
      await repo.analyze(
    symptomsController.text,
  );

  setState(() {

    result =
        response.toString();
  });
                },

                child:
                    const Text(
                  "Analyze",
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Card(
              child: Padding(
                padding:
                    const EdgeInsets.all(
                        16),

                child: Text(
                  result,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
