import 'package:flutter/material.dart';
import 'package:pisang_app/detectionpage.dart';
import 'package:pisang_app/landingpage.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _HomeState();
}

class _HomeState extends State<bottomnavbar> {
  int selectedIndex = 0;

  void updateIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: [
            Landingpage(
              onButtonPressed: () {
                updateIndex(1);
              },
            ),
            Detectionpage(),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.purple,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: updateIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notification_important,
                ),
                label: ""),
          ],
        ),
      ),
    );
  }
}
