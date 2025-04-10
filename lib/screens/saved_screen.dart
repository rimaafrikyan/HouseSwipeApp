import 'package:flutter/material.dart';
import 'package:house_swipe_app/providers/house_manager.dart';
import 'package:house_swipe_app/screens/house_details_screen.dart';
import 'package:house_swipe_app/utils/theme.dart';
import 'package:house_swipe_app/widgets/house_leked_card.dart';
import 'package:provider/provider.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final houseManager = Provider.of<HouseManager>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset("assets/images/save.png", width: 40, height: 40),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 3,
                children: houseManager.savedHouses.map((house) {
                  Map<String, dynamic> fullHouseData;

                  try {
                    fullHouseData = houseManager.houses
                        .firstWhere((h) => h['id'] == house['id']);
                  } catch (e) {
                    try {
                      fullHouseData = houseManager.dislikedHouses
                          .firstWhere((h) => h['id'] == house['id']);
                    } catch (e) {
                      fullHouseData = house;
                    }
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HouseDetailsScreen(
                            id: fullHouseData['id'],
                            imagePath: fullHouseData['imagePath'],
                            title: fullHouseData['title'],
                            price: fullHouseData['price'] ?? 'No price',
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
                    },
                    child: HouseLekedCard(
                      imagePath: fullHouseData['imagePath'],
                      title: fullHouseData['title'],
                      price: fullHouseData['price'] ?? 'No price',
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
