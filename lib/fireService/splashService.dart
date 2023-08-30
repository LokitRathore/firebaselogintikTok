

import 'dart:async';

import 'package:flutter/material.dart';

import '../auth/loginPage.dart';

class SplashService {
  void IsLogin (BuildContext context) {
    Timer(Duration(seconds: 3), () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())) );
  }
}