import 'package:flutter/material.dart';
import 'package:uber_clone/tabPages/earning_tab.dart';
import 'package:uber_clone/tabPages/home_tab.dart';
import 'package:uber_clone/tabPages/profile_tab.dart';
import 'package:uber_clone/tabPages/ratings_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeTabPage(),
          EarningTabPage(),
          RatingsTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blueGrey[900],
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "Earnings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Ratings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          )
        ],
      ),
    );
  }
}
