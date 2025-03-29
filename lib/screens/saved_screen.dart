// import 'package:flutter/material.dart';
// import 'package:house_swipe_app/utils/theme.dart';

// class SavedScreen extends StatefulWidget {
//   const SavedScreen({super.key});

//   @override
//   State<SavedScreen> createState() => _SavedScreenState();
// }

// class _SavedScreenState extends State<SavedScreen> {
//   final List<String> images = [
//     'assets/images/home1.png',
//     'assets/images/home2.png',
//     'assets/images/home2.png',
//     'assets/images/home1.png',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           final double screenWidth = constraints.maxWidth;
//           final double itemSize = screenWidth * 0.35;
//           final double saveIconSize = screenWidth * 0.06;

//           return Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 SizedBox(
//                   child: Image.asset('assets/images/save.png'),
//                 ),
//                 const SizedBox(height: 20),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                       maxCrossAxisExtent: itemSize,
//                       childAspectRatio: 1,
//                       mainAxisSpacing: 8,
//                       crossAxisSpacing: 8,
//                     ),
//                     itemCount: images.length,
//                     itemBuilder: (context, index) {
//                       return Stack(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(12),
//                             child: Image.asset(
//                               images[index],
//                               width: itemSize,
//                               height: itemSize,
//                               fit: BoxFit.cover,
//                             ),
//                           ),

//                         ],
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:house_swipe_app/providers/saved_manager.dart';
import 'package:house_swipe_app/screens/house_details_screen.dart';
import 'package:house_swipe_app/utils/theme.dart';
import 'package:house_swipe_app/widgets/house_leked_card.dart';
import 'package:provider/provider.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final savedManager = Provider.of<SavedManager>(context);

    if (savedManager.savedHouses.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/save.png', width: 60, height: 60),
            const SizedBox(height: 20),
            const Text(
              "No saved houses yet",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      );
    }

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
                children: savedManager.savedHouses.map((house) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HouseDetailsScreen(
                            id: house['id'],
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
