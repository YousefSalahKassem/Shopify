import 'package:evira/styles/colors.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';

SizedBox outLineButton(BuildContext context,IconData icon, VoidCallback onPressed) {
  return SizedBox(
    width: context.height20 * 2,
    height: context.height30,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.height30),
        ),
      ),
      onPressed: onPressed,
      child: Icon(icon, color: kPrimaryColor,),
    ),
  );
}
