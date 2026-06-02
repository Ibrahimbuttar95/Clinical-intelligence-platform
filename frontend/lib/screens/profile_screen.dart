import 'package:flutter/material.dart';

class ProfileScreen
    extends StatefulWidget {

  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen>
      createState() =>
          _ProfileScreenState();
}

class _ProfileScreenState
    extends State<ProfileScreen> {

  final ageController =
      TextEditingController();

  final allergyController =
      TextEditingController();

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
            const Text("Profile"),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller:
                  ageController,

              decoration:
                  const InputDecoration(
                labelText:
                    "Age",
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            TextField(
              controller:
                  allergyController,

              decoration:
                  const InputDecoration(
                labelText:
                    "Allergies",
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {},

              child: const Text(
                "Save",
              ),
            )
          ],
        ),
      ),
    );
  }
}
