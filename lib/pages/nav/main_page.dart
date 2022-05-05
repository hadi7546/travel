import 'package:flutter/material.dart';
import 'package:travel/pages/nav/chart_page.dart';
import 'package:travel/pages/home_page.dart';
import 'package:travel/pages/nav/profile_page.dart';
import 'package:travel/pages/nav/search_page.dart';
import 'package:travel/utility/strings.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage()
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBarTheme(
        data: BottomNavigationBarThemeData(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: Colors.black54),
          unselectedIconTheme: IconThemeData(
            color: Colors.grey.withOpacity(0.5),
          ),
          elevation: 0,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: AppTexts.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp),
              label: AppTexts.chart,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: AppTexts.search,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: AppTexts.profile,
            ),
          ],
        ),
      ),
    );
  }
}
