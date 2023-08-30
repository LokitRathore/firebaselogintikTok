import 'package:flutter/material.dart';
import 'package:myloginsec/fireService/splashService.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashScreen = SplashService();

  @override
  void initState () {
    super.initState();
    splashScreen.IsLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash screen", style: TextStyle(fontSize: 32,color: Colors.blue),),
      ),
    );
  }
}
