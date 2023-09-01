import 'package:flutter/material.dart';

class PostLogin extends StatefulWidget {
  const PostLogin({super.key});

  @override
  State<PostLogin> createState() => _PostLoginState();
}

class _PostLoginState extends State<PostLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("PostLogin"),
      ),
    );
  }
}
