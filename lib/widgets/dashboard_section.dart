import 'package:flutter/material.dart';

class DashboardSection extends StatelessWidget {
  final Widget child;
  final String title;
  final String subtitle;

  const DashboardSection(
      {Key? key,
      required this.child,
      required this.title,
      required this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(children: [
        ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ),
        Divider(),
        SizedBox(
          height: 8,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16), child: child)
      ]),
    );
  }
}
