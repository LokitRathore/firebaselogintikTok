import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RaisedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const RaisedButton({super.key,
    required this.title,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(title, style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
