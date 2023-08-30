import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myloginsec/auth/SignUpScreen.dart';
import 'package:myloginsec/reuse/raisedButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ( ) async{
        SystemNavigator.pop();
        return true;
      } ,
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
                onTap: () {
                  if(_formKey.currentState!.validate()) {

                  }
                },
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have account"),
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUPScreen()));
                  } , child: Text("Sing in"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
