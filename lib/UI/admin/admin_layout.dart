import 'package:feedback_app/UI/admin/summary_page.dart';
import 'package:feedback_app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

class AdminLayout extends StatefulWidget {
  const AdminLayout({Key? key}) : super(key: key);

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  int activeIndex = 0;
  List<String> navigationTitles = AppConfigs.faculties;
  void onTabTapped(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (context.breakpoint > LayoutBreakpoint.sm)
      return Scaffold(
        appBar: AppBar(
          title: const Text('Admin Summary'),
        ),
        body: Row(
          children: [
            AdminSidebar(
              activeIndex: activeIndex,
              onTabTapped: onTabTapped,
              navigationTitles: navigationTitles,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SummaryAnalytics(
                  activeIndex: activeIndex,
                ),
              ),
            )
          ],
        ),
      );
    else
      return Scaffold(
        appBar: AppBar(
          title: const Text('Admin Summary'),
        ),
        drawer: AdminSidebar(
          activeIndex: activeIndex,
          onTabTapped: onTabTapped,
          navigationTitles: navigationTitles,
        ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: SummaryAnalytics(
            activeIndex: activeIndex,
          ),
        ),
      );
  }
}

class AdminSidebar extends StatelessWidget {
  const AdminSidebar(
      {Key? key,
      required this.activeIndex,
      required this.onTabTapped,
      required this.navigationTitles})
      : super(key: key);

  final int activeIndex;
  final ValueChanged<int> onTabTapped;
  final List<String> navigationTitles;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView.builder(
          itemCount: navigationTitles.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(navigationTitles[index] + ' Faculty'),
              onTap: () {
                onTabTapped(index);
              },
              tileColor: index == activeIndex ? Colors.purple.shade300 : null,
              selected: index == activeIndex,
            );
          }),
    );
  }
}
