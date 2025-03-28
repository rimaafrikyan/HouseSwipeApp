import 'package:flutter/material.dart';
import 'package:house_swipe_app/screens/add_screen.dart';
import 'package:house_swipe_app/screens/liked_screen.dart';
import 'package:house_swipe_app/screens/profile_screen.dart';
import 'package:house_swipe_app/screens/saved_screen.dart';
import 'package:house_swipe_app/utils/theme.dart';
import 'package:house_swipe_app/widgets/bottom_nav_bar.dart';
import 'package:house_swipe_app/widgets/house_detail_card.dart';

class HouseData {
  static final List<Map<String, dynamic>> houses = [
    {
      'imagePath': 'assets/images/home1.png',
      'title': 'Modern Luxury Home',
      'price': '395.75 UFS',
      'description':
          'Modern luxury home with sleek design, floor-to-ceiling windows, and seamless indoor-outdoor living.',
      'area': '150 square feet',
      'quantity': '2',
      'detailedDescription':
          'Discover this stunning modern architectural masterpiece, featuring sleek geometric design, expansive glass walls, and a spacious open-plan interior. This home offers a seamless indoor-outdoor living experience, with a stylish balcony, high ceilings, and premium finishes. Nestled in a serene neighborhood, it provides the perfect blend of luxury and comfort.',
      'keyFeatures': [
        'Floor-to-ceiling glass windows for natural light',
        'Contemporary open-concept living space',
        'Private balcony with scenic views',
        'Beautiful landscaped garden & walkway',
        '3 bedrooms, 2 bathrooms'
      ],
      'location': 'Yerevan'
    },
    {
      'imagePath': 'assets/images/home2.png',
      'title': 'Elegant Home',
      'price': '500.95 UFS',
      'description':
          'A sophisticated modern home featuring a sleek design, panoramic glass windows, and seamless indoor-outdoor flow.',
      'area': '200 square feet',
      'quantity': '1',
      'detailedDescription':
          'Step into luxury and sophistication with this stunning contemporary home, designed for modern living. Featuring expansive glass walls, a spacious open layout, and a seamless connection to nature, this home offers breathtaking views and a serene atmosphere. With high-end finishes and thoughtful architecture, it’s the perfect blend of style, comfort, and functionality.',
      'keyFeatures': [
        'Floor-to-ceiling windows for abundant natural light',
        'Minimalist yet elegant architecture',
        'Private balcony & outdoor lounge area',
        ' Spacious, open-plan interior with high ceilings',
        '4 bedrooms, 2 bathrooms'
      ],
      'location': 'Yerevan'
    },
    {
      'imagePath': 'assets/images/home3.png',
      'title': 'Modern Home',
      'price': '695.75 UFS',
      'description':
          'A sleek, contemporary home offering a perfect blend of style, comfort, and nature.',
      'area': '180 square feet',
      'quantity': '1',
      'detailedDescription':
          'A sleek, contemporary home offering a perfect blend of style, comfort, and nature.',
      'keyFeatures': [
        'Floor-to-ceiling glass windows for natural light',
        'Contemporary open-concept living space',
        'Private balcony with scenic views',
        'Beautiful landscaped garden & walkway',
        '3 bedrooms, 2 bathrooms'
      ],
      'location': 'Yerevan'
    },
    {
      'imagePath': 'assets/images/home4.png',
      'title': 'Elegant Home',
      'price': '700.95 UFS',
      'description':
          'A sophisticated modern home featuring a sleek design, panoramic glass windows, and seamless indoor-outdoor flow.',
      'area': '200 square feet',
      'quantity': '1',
      'detailedDescription':
          'Step into luxury and sophistication with this stunning contemporary home, designed for modern living. Featuring expansive glass walls, a spacious open layout, and a seamless connection to nature, this home offers breathtaking views and a serene atmosphere. With high-end finishes and thoughtful architecture, it’s the perfect blend of style, comfort, and functionality.',
      'keyFeatures': [
        'Floor-to-ceiling windows for abundant natural light',
        'Minimalist yet elegant architecture',
        'Private balcony & outdoor lounge area',
        ' Spacious, open-plan interior with high ceilings',
        '4 bedrooms, 2 bathrooms'
      ],
      'location': 'Yerevan'
    },
  ];
}

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
        // title: Text(
        //   'Home',
        //   style: Theme.of(context).appBarTheme.titleTextStyle,
        // ),
        
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
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
      },
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemCount: HouseData.houses.length,
        itemBuilder: (context, index) {
          final house = HouseData.houses[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: HouseDetailCard(
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

