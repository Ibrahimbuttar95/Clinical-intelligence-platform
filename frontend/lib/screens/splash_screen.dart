import 'package/material.dart';

import 'startup_screen.dart';

class SplashScreenextends StatefulWidget {

const SplashScreen({super.key,});

@overrideStatecreateState() =>_SplashScreenState();}

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {const SplashScreen({super.key});

@overrideState createState() =>_SplashScreenState();}

class _SplashScreenStateextends State {

@overridevoid initState() {

super.initState();

Future.delayed(
  const Duration(
    seconds: 2,
  ),
  () {

    if (!mounted) return;

    Navigator.pushReplacement(
      context,

      MaterialPageRoute(
        builder: (_) =>
            const StartupScreen(),
      ),
    );
  },
);

@overridevoid initState() {super.initState();

Future.delayed(
  const Duration(seconds: 3),
  () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const LoginScreen(),
      ),
    );
  },
);

}

@overrideWidget build(BuildContext context) {

return const Scaffold(
  body: Center(
    child: Text(
      "Clinical Intelligence Platform",
    ),
  ),
);

}}

@overrideWidget build(BuildContext context) {

return Scaffold(
  body: Center(
    child: Column(
      mainAxisAlignment:
          MainAxisAlignment.center,
      children: const [

        Icon(
          Icons.health_and_safety,
          size: 90,
        ),

        SizedBox(height: 20),

        Text(
          "Clinical Intelligence Platform",
          style: TextStyle(
            fontSize: 24,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
);

}}@overrideWidget build(BuildContext context) {return const Scaffold(body: Center(child: Text("Clinical Intelligence",style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold,),),),);}}    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: const [

            Icon(
              Icons.health_and_safety,
              size: 90,
            ),

            SizedBox(height: 20),

            Text(
              "Clinical Intelligence Platform",
              style: TextStyle(
                fontSize: 24,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  @override
  Widget build(
      BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Clinical Intelligence",
          style: TextStyle(
            fontSize: 24,
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
