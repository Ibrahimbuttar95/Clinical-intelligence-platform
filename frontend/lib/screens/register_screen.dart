final authRepo =
    AuthRepository();

await authRepo.register(
  emailController.text,
  passwordController.text,
);
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
              width:
                  double.infinity,

              child:
                  ElevatedButton(
                onPressed: () {},

                child:
                    const Text(
                  "Register",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
