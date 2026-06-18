import 'package:flutter/material.dart';

class ReportScreen
extends StatelessWidget {

const ReportScreen({
super.key,
});

@override
Widget build(BuildContext context) {

return Scaffold(

  appBar: AppBar(
    title: const Text(
      "Clinical Report",
    ),
  ),

  body: ListView(
    padding:
        const EdgeInsets.all(16),

    children: const [

      Card(
        child: Padding(
          padding:
              EdgeInsets.all(16),
          child: Text(
            "Generated Clinical Report Appears Here",
          ),
        ),
      ),
    ],
  ),
);

}
}
