import 'package:flutter/material.dart';

class RateButton extends StatelessWidget {
  RateButton({required this.icon, required this.onPressed, required this.isActive});
  void Function() onPressed;
  IconData icon;
  bool isActive;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(icon,color: isActive ? Colors.purple : Colors.grey ,size: 34,));
  }
}
