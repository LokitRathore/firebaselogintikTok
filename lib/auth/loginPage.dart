import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myloginsec/auth/SignUpScreen.dart';

import '../game/screens/game.dart';
import '../pages/postLogin.dart';
import '../reuse/raisedButton.dart';
import '../utils/utils.dart';
// import 'package:login_project/auth/SignUpScreen.dart';
// import 'package:login_project/reuse/raisedButton.dart';
// import 'package:login_project/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading =true;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text)
        .then((value) {
      Utils().toastMsg(value.user!.email.toString());
      // Navigator.push(context, MaterialPageRoute(builder: (context)=> PostLogin()));
      Navigator.push(context, MaterialPageRoute(builder: (context)=> GameScreen()));
      setState(() {
        loading =false;
      });
    })
        .catchError((error, stackTrace) {
      Utils().toastMsg(error);
      setState(() {
        loading =false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "email", helperText: "enter email"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "email is empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: "email", helperText: "enter email"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password is empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
              RaisedButton(
                title: "Log In",
                loading: true,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    login();
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUPScreen()));
                      },
                      child: Text("Sing in"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
