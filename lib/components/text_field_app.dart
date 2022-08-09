import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  String label, hint, valid;
  TextEditingController controller;
  IconData icon;
  TextInputType type;
  bool isPassword;
  TextFieldApp({Key? key,required this.label,required this.hint,required this.valid,required this.controller,required this.icon,required this.type , this.isPassword=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return valid;
            }
            return null;
          },
          decoration: InputDecoration(
            suffixIcon: Icon(icon),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hint,
            labelText: label,
          ),
        )
      ],
    );
  }
}
