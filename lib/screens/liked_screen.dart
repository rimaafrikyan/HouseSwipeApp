import 'package:flutter/material.dart';
import 'package:house_swipe_app/providers/favorite_manager.dart';
import 'package:house_swipe_app/providers/house_manager.dart';
import 'package:house_swipe_app/screens/disliked_screen.dart';
import 'package:house_swipe_app/screens/home_screen.dart';
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
    final houseManager = Provider.of<HouseManager>(context);

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
                    final fullHouseData = houseManager.houses.firstWhere(
                      (h) => h['title'] == house['title'],
                      orElse: () => {},
                    );

                    return GestureDetector(
                      onTap: () {
                        if (fullHouseData.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HouseDetailsScreen(
                                imagePath: house['imagePath'],
                                title: house['title'],
                                price: house['price'] ?? 'No price',
                                description: fullHouseData['description'] ?? '',
                                area: fullHouseData['area'] ?? '',
                                quantity: fullHouseData['quantity'] ?? '',
                                detailedDescription:
                                    fullHouseData['detailedDescription'] ?? '',
                                keyFeatures: List<String>.from(
                                    fullHouseData['keyFeatures'] ?? []),
                                location: fullHouseData['location'] ?? '',
                              ),
                            ),
                          );
                        }
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
