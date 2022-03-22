import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  const StyledTextField({
    required this.title,
    required this.icon,
    this.isSecure = false,
    required this.onTextChange,
  });

  final String title;
  final IconData icon;
  final bool isSecure;
  final Function(String) onTextChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onTextChange,
      obscureText: isSecure,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black45,
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white54,
              width: 10.0,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white54,
              width: 1.0,
            ),
          ),
          labelText: title,
          labelStyle: TextStyle(color: Colors.white)),
    );
  }
}
