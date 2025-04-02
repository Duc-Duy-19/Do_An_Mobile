import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  //const MyWidget({super.key});
  final VoidCallback onPressed;
  final String name;
  const MyButton({super.key,required this.onPressed, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      // width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue), // ✅ Đúng cú pháp),
        child: Text(name,style: TextStyle(color: Colors.black))
        ),  
    );
  }
}