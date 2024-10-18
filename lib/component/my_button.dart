import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key,required this.title,required this.onPressed});
   String title;
  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: MaterialButton(
        color: Colors.yellow,
        onPressed:onPressed ,
        child: Text(title),),
    );
  }
}
