import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Assessment History",
        ),
      ),

      body: ListView.builder(

        itemCount: 10,

        itemBuilder:
            (context, index) {

          return ListTile(

            leading: const Icon(
              Icons.description,
            ),

            title: Text(
              "Assessment ${index + 1}",
            ),

            subtitle: const Text(
              "Previous result",
            ),
          );
        },
      ),
    );
  }
}
