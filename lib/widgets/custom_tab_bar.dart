import 'package:flutter/material.dart';
import 'package:house_swipe_app/utils/theme.dart';

class CustomTabBar extends StatelessWidget {
  final TabController? tabController;
  final List<Widget> tabViews;

  const CustomTabBar({
    super.key,
    this.tabController,
    required this.tabViews,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: [
            Material(
              color: AppColors.backgroundColor,
              type: MaterialType.transparency,
              child: TabBar(
                controller: tabController,
                dividerColor: Colors.transparent,
                indicatorWeight: 2.0,
                indicatorColor: const Color(0xFF324059),
                labelColor: const Color(0xFF324059),
                unselectedLabelColor: const Color.fromARGB(146, 50, 64, 89),
                tabs: const [
                  Tab(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text('liked', textAlign: TextAlign.center),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text('disliked', textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: tabViews,
              ),
            ),
          ],
        ),
      ),
    );
  }
}