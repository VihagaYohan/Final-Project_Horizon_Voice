import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  DashboardTile({required this.text, required this.onPressed, this.icon});

  final String text;
  final Icon? icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromRGBO(248, 246, 248, 0.678),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.deepPurpleAccent,
            width: 1.0,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon ?? Container(),
              icon !=null ? SizedBox(height: 12,):Container(),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
