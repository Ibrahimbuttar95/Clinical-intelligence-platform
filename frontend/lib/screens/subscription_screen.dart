import 'package:flutter/material.dart';

class SubscriptionScreen
    extends StatelessWidget {

  const SubscriptionScreen({
    super.key,
  });

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Premium Plans",
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          children: [

            Card(
              child: ListTile(
                title:
                    const Text(
                  "Pro Monthly",
                ),

                subtitle:
                    const Text(
                  "PKR 999",
                ),

                trailing:
                    ElevatedButton(
                  onPressed: () {},

                  child:
                      const Text(
                    "Buy",
                  ),
                ),
              ),
            ),

            Card(
              child: ListTile(
                title:
                    const Text(
                  "Pro Yearly",
                ),

                subtitle:
                    const Text(
                  "PKR 9999",
                ),

                trailing:
                    ElevatedButton(
                  onPressed: () {},

                  child:
                      const Text(
                    "Buy",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
