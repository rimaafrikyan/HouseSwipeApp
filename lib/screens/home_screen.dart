import 'package:flutter/material.dart';
import 'package:house_swipe_app/providers/house_manager.dart';
import 'package:house_swipe_app/screens/add_screen.dart';
import 'package:house_swipe_app/screens/liked_screen.dart';
import 'package:house_swipe_app/screens/profile_screen.dart';
import 'package:house_swipe_app/screens/saved_screen.dart';
import 'package:house_swipe_app/utils/theme.dart';
import 'package:house_swipe_app/widgets/bottom_nav_bar.dart';
import 'package:house_swipe_app/widgets/house_detail_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = const [
      _HomeContent(),
      LikedScreen(),
      AddScreen(),
      SavedScreen(),
      ProfileScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(194, 115, 130, 146),
        title: Center(
          child: Text(
            'Swipe your dream home',
            style: TextStyle(
              color: AppColors.titleColor,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              
            ),
          ),
        ),

        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    final houseManager = Provider.of<HouseManager>(context);
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemCount: houseManager.houses.length,
        itemBuilder: (context, index) {
          final house = houseManager.houses[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: HouseDetailCard(
              id: house['id'],
              imagePath: house['imagePath'],
              title: house['title'],
              price: house['price'],
              description: house['description'],
              area: house['area'],
              quantity: house['quantity'],
              detailedDescription: house['detailedDescription'],
              keyFeatures: house['keyFeatures'],
              location: house['location'],
            ),
          );
        },
      ),
    );
  }
}
