import 'package:flutter/material.dart';
import 'package:house_swipe_app/providers/favorite_manager.dart';
import 'package:house_swipe_app/screens/disliked_screen.dart';
import 'package:house_swipe_app/screens/house_details_screen.dart';
import 'package:house_swipe_app/widgets/custom_tab_bar.dart';
import 'package:house_swipe_app/widgets/house_leked_card.dart';
import 'package:provider/provider.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final favoriteManager = FavoriteManager();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteManager = Provider.of<FavoriteManager>(context);
    return CustomTabBar(
      tabController: _tabController,
      tabViews: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                child: Image.asset("assets/images/favorite.png"),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1, 
                  childAspectRatio: 3, 
                  children: favoriteManager.favorites.map((house) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HouseDetailsScreen(
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
                          ),
                        );
                      },
                      child: HouseLekedCard(
                        imagePath: house['imagePath'],
                        title: house['title'],
                        price: house['price'] ?? 'No price',
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        const DislikedScreen(),
      ],
    );
  }
}
