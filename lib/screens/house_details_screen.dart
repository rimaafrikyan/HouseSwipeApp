import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:house_swipe_app/providers/house_manager.dart';
import 'package:house_swipe_app/utils/theme.dart';
import 'package:house_swipe_app/providers/favorite_manager.dart';
import 'package:house_swipe_app/providers/dislike_manager.dart';
import 'package:provider/provider.dart';

class HouseDetailsScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String price;
  final String description;
  final String area;
  final String quantity;
  final String detailedDescription;
  final List<String> keyFeatures;
  final String location;

  const HouseDetailsScreen({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description,
    required this.area,
    required this.quantity,
    required this.detailedDescription,
    required this.keyFeatures,
    required this.location,
    Key? key,
  }) : super(key: key);

  @override
  _HouseDetailsScreenState createState() => _HouseDetailsScreenState();
}

class _HouseDetailsScreenState extends State<HouseDetailsScreen> {
  bool isFavorite = false;
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    final favoriteManager = Provider.of<FavoriteManager>(context);
    final dislikeManager = Provider.of<DislikeManager>(context);

    isFavorite = favoriteManager.favorites
        .any((house) => house['title'] == widget.title);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 361,
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 170,
                  color: const Color(0xFF20314D).withOpacity(0.8),
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 1.2,
                            ),
                          ),
                          Text(
                            widget.price,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Description: ",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: widget.description,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Area: ",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.area,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Quantity: ",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: widget.quantity,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: 17,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      final houseManager =
                          Provider.of<HouseManager>(context, listen: false);
                      final favoriteManager =
                          Provider.of<FavoriteManager>(context, listen: false);
                      setState(() {
                        isFavorite = !isFavorite;
                        if (isFavorite) {
                          favoriteManager.addFavorite({
                            'imagePath': widget.imagePath,
                            'title': widget.title,
                            'price': widget.price,
                          });
                          houseManager.restoreFromDisliked(widget.title);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('${widget.title} added to favorites')),
                          );
                        } else {
                          favoriteManager.removeFavorite(widget.title);
                        }
                      });
                    },
                    child: Image.asset(
                      isFavorite
                          ? 'assets/images/favorite2.png'
                          : 'assets/images/favorite.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      dislikeManager.addDislike({
                        'imagePath': widget.imagePath,
                        'title': widget.title,
                        'price': widget.price,
                      });

                      if (favoriteManager.favorites
                          .any((h) => h['title'] == widget.title)) {
                        favoriteManager.removeFavorite(widget.title);
                        setState(() => isFavorite = false);
                      }

                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/close.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
                    child: Image.asset(
                      isSaved
                          ? 'assets/images/save2.png'
                          : 'assets/images/save.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.titleColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.detailedDescription,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF1C273A),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Key Features:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.titleColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      for (var feature in widget.keyFeatures)
                        _buildFeatureItem(feature),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset('assets/images/location.png'),
                      const SizedBox(width: 8),
                      Text(
                        widget.location,
                        style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF1C273A),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.circle, size: 8, color: Color(0xFF1C273A)),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Color(0xFF1C273A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
