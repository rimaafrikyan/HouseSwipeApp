import 'package:flutter/material.dart';
import 'package:house_swipe_app/providers/dislike_manager.dart';
import 'package:house_swipe_app/providers/house_manager.dart';
import 'package:house_swipe_app/screens/home_screen.dart';
import 'package:house_swipe_app/screens/house_details_screen.dart';
import 'package:house_swipe_app/utils/theme.dart';
import 'package:house_swipe_app/widgets/house_leked_card.dart';
import 'package:provider/provider.dart';

class DislikedScreen extends StatefulWidget {
  const DislikedScreen({super.key});

  @override
  State<DislikedScreen> createState() => _DislikedScreenState();
}

class _DislikedScreenState extends State<DislikedScreen> {
  @override
  Widget build(BuildContext context) {
    final houseManager = Provider.of<HouseManager>(context);

    if (houseManager.dislikedHouses.isEmpty) {
      return const Center(child: Text("No disliked houses yet"));
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset("assets/images/close.png", width: 40, height: 40),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 3,
                children: houseManager.dislikedHouses.map((house) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HouseDetailsScreen(
                            imagePath: house['imagePath'],
                            title: house['title'],
                            price: house['price'] ?? 'No price',
                            description: house['description'] ?? '',
                            area: house['area'] ?? '',
                            quantity: house['quantity'] ?? '',
                            detailedDescription:
                                house['detailedDescription'] ?? '',
                            keyFeatures:
                                List<String>.from(house['keyFeatures'] ?? []),
                            location: house['location'] ?? '',
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
    );
  }
}
