import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myloginsec/auth/loginPage.dart';
import 'package:myloginsec/reuse/raisedButton.dart';
import 'package:myloginsec/utils/utils.dart';

class SignUPScreen extends StatefulWidget {
  const SignUPScreen({super.key});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              title: "Sign up",
              onTap: () {
                if(_formKey.currentState!.validate()) {
                  _auth.createUserWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString()).then(
                          (value) {
                            Text("$emailController is for $passwordController");
                  }).onError((error, stackTrace) {
                    Utils().toastMsg(error.toString());
                  });
                }
              },
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Text("Already have account"),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                } , child: Text("Log In"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
