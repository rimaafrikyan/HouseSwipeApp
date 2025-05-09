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
          automaticallyImplyLeading: false),
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

    final visibleHouses = houseManager.houses.where((house) {
      return !houseManager.isFavorite(house['id']);
    }).toList();
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: houseManager.houses.length,
      itemBuilder: (context, index) {
        final house = houseManager.houses[index];
        if (houseManager.dislikedHouses.contains(house['id'])) {
          return SizedBox.shrink();
        }
        return _SwipeableHouseCard(
          key: ValueKey(house['id']),
          house: house,
          onSwipeRight: () {
            houseManager.addToFavorites(house['id']);
          },
          onSwipeLeft: () => houseManager.removeAndAddToDisliked(house['id']),
        );
      },
    );
  }
}

class _SwipeableHouseCard extends StatefulWidget {
  final Map<String, dynamic> house;
  final VoidCallback onSwipeRight;
  final VoidCallback onSwipeLeft;

  const _SwipeableHouseCard({
    required Key key,
    required this.house,
    required this.onSwipeRight,
    required this.onSwipeLeft,
  }) : super(key: key);

  @override
  State<_SwipeableHouseCard> createState() => _SwipeableHouseCardState();
}

class _SwipeableHouseCardState extends State<_SwipeableHouseCard> {
  double _offset = 0.0;
  bool _isSwiped = false;

  @override
  Widget build(BuildContext context) {
    if (_isSwiped) return const SizedBox.shrink();

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onHorizontalDragUpdate: (details) {
        setState(() => _offset += details.delta.dx);
      },
      onHorizontalDragEnd: (details) {
        if (_offset.abs() > 100) {
          setState(() => _isSwiped = true);
          _offset > 0 ? widget.onSwipeRight() : widget.onSwipeLeft();
        } else {
          setState(() => _offset = 0);
        }
      },
      
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: Transform(
          transform: Matrix4.identity()
            ..translate(_offset)
            ..rotateZ(_offset / 100 * 0.2),
          alignment: Alignment.center,
          child: Opacity(
            opacity: (1 - _offset.abs() / 300).clamp(0.0, 1.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: HouseDetailCard(
                id: widget.house['id'],
                imagePath: widget.house['imagePath'],
                title: widget.house['title'],
                price: widget.house['price'],
                description: widget.house['description'],
                area: widget.house['area'],
                quantity: widget.house['quantity'],
                detailedDescription: widget.house['detailedDescription'],
                keyFeatures: widget.house['keyFeatures'],
                location: widget.house['location'],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
