import 'package:flutter/material.dart';
import 'package:house_swipe_app/providers/dislike_manager.dart';
import 'package:house_swipe_app/utils/theme.dart';
import 'package:house_swipe_app/widgets/house_leked_card.dart';
import 'package:provider/provider.dart';

class DislikedScreen extends StatefulWidget {
  const DislikedScreen({super.key});

  @override
  State<DislikedScreen> createState() => _DislikedScreenState();
}

class _DislikedScreenState extends State<DislikedScreen> {
  final dislikeManager = DislikeManager();
  @override
  Widget build(BuildContext context) {
    final dislikeManager = Provider.of<DislikeManager>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
            child: Column(
            children: [
              SizedBox(
                child: Image.asset("assets/images/close.png"),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: 3, 
                  children: dislikeManager.dislikes.map((house) {
                    return HouseLekedCard(
                      imagePath: house['imagePath'],
                      title: house['title'],
                      price: house['price'] ?? 'No price',
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
