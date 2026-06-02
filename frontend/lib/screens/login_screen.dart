import 'package:flutter/material.dart';

import 'register_screen.dart';
import 'home_screen.dart';

class LoginScreen
    extends StatefulWidget {

  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen>
      createState() =>
          _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {

  final emailController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  bool loading = false;

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
            const Text("Login"),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller:
                  emailController,
              decoration:
                  const InputDecoration(
                labelText:
                    "Email",
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            TextField(
              controller:
                  passwordController,
              obscureText: true,
              decoration:
                  const InputDecoration(
                labelText:
                    "Password",
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            SizedBox(
              width: double.infinity,

              child:
                  ElevatedButton(
                onPressed: () {

                  Navigator.pushReplacement(
                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                          const HomeScreen(),
                    ),
                  );
                },

                child:
                    const Text(
                        "Login"),
              ),
            ),

            TextButton(
              onPressed: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (_) =>
                        const RegisterScreen(),
                  ),
                );
              },

              child: const Text(
                "Create Account",
              ),
            )
          ],
        ),
      ),
    );
  }
}
            TextField(
              obscureText: true,
              decoration:
                  const InputDecoration(
                labelText:
                    "Password",
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(
              onPressed: () {},
              child:
                  const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
