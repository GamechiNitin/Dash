import 'package:dash/utils/colors.dart';
import 'package:dash/view/features/home/ui/homepage.dart';
import 'package:dash/view/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: TabBarView(
        controller: tabController,
        children: const [
          HomePage(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: kToolbarHeight,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: kWhiteColor,
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              offset: Offset(6, 6),
              spreadRadius: 1,
              blurRadius: 4,
            ),
            BoxShadow(
              color: kSecondaryColor.withOpacity(0.1),
              offset: const Offset(-6, -6),
              spreadRadius: 1,
              blurRadius: 4,
            )
          ],
        ),
        child: TabBar(
          controller: tabController,
          indicatorColor: kSecondaryColor,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: kPrimaryColor,
          unselectedLabelColor: kBlack54Color,
          labelStyle: const TextStyle(
            color: kPrimaryColor,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            color: kPrimaryColor,
            fontSize: 12,
          ),
          indicatorWeight: 3.5,
          tabs: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home,
                  color: Theme.of(context).tabBarTheme.labelColor,
                ),
                Text("Home", style: Theme.of(context).tabBarTheme.labelStyle),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person),
                Text("Profile",
                    style: Theme.of(context).tabBarTheme.labelStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
