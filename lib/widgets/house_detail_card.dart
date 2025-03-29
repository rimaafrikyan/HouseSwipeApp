import 'package:flutter/material.dart';
import 'package:house_swipe_app/providers/dislike_manager.dart';
import 'package:house_swipe_app/providers/favorite_manager.dart';
import 'package:house_swipe_app/providers/house_manager.dart';
import 'package:house_swipe_app/providers/saved_manager.dart';
import 'package:house_swipe_app/screens/home_screen.dart';
import 'package:house_swipe_app/screens/house_details_screen.dart';
import 'package:provider/provider.dart';

class HouseDetailCard extends StatefulWidget {
  final int id;
  final String imagePath;
  final String title;
  final String price;
  final String description;
  final String area;
  final String quantity;
  final String detailedDescription;
  final List<String> keyFeatures;
  final String location;

  const HouseDetailCard({
    required this.id,
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
  _HouseDetailCardState createState() => _HouseDetailCardState();
}

class _HouseDetailCardState extends State<HouseDetailCard> {
  bool isFavorite = false;
  // bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    final savedManager = Provider.of<SavedManager>(context);
    final isSaved = savedManager.savedHouses.any((h) => h['id'] == widget.id);
    final favoriteManager = Provider.of<FavoriteManager>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;

    isFavorite =
        favoriteManager.favorites.any((house) => house['id'] == widget.id);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HouseDetailsScreen(
                      id: widget.id,
                      imagePath: widget.imagePath,
                      title: widget.title,
                      price: widget.price,
                      description: widget.description,
                      area: widget.area,
                      quantity: widget.quantity,
                      detailedDescription: widget.detailedDescription,
                      keyFeatures: widget.keyFeatures,
                      location: widget.location,
                    ),
                  ),
                );
              },
              child: Container(
                width: cardWidth,
                height: 361,
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: cardWidth,
              height: 170,
              color: Color(0xFF20314D).withOpacity(0.7),
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
                          color: const Color.fromARGB(221, 243, 243, 243),
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          letterSpacing: 1.2,
                        ),
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(
                          color: const Color.fromARGB(221, 243, 243, 243),
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Color.fromARGB(161, 255, 255, 255),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Description: ",
                            style: TextStyle(
                              color: const Color.fromARGB(207, 243, 243, 243),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: widget.description,
                            style: TextStyle(
                              color: const Color.fromARGB(207, 243, 243, 243),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Area: ",
                              style: TextStyle(
                                color: const Color.fromARGB(207, 243, 243, 243),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: widget.area,
                              style: TextStyle(
                                color: const Color.fromARGB(207, 243, 243, 243),
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Quantity: ",
                              style: TextStyle(
                                color: const Color.fromARGB(207, 243, 243, 243),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: widget.quantity,
                              style: TextStyle(
                                color: const Color.fromARGB(207, 243, 243, 243),
                                fontSize: 17,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: cardWidth,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                    if (isFavorite) {
                      favoriteManager.addFavorite({
                        'id': widget.id,
                        'imagePath': widget.imagePath,
                        'title': widget.title,
                        'price': widget.price,
                      });
                    } else {
                      favoriteManager.removeFavorite(widget.id);
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
                  final houseManager =
                      Provider.of<HouseManager>(context, listen: false);
                  final favoriteManager =
                      Provider.of<FavoriteManager>(context, listen: false);

                  if (favoriteManager.favorites
                      .any((h) => h['id'] == widget.id)) {
                    favoriteManager.removeFavorite(widget.id);
                  }

                  houseManager.removeAndAddToDisliked(widget.id);

                  if (Navigator.of(context).canPop()) Navigator.pop(context);
                },
                child: Image.asset('assets/images/close.png',
                    width: 40, height: 40),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  final savedManager =
                      Provider.of<SavedManager>(context, listen: false);
                  final houseManager =
                      Provider.of<HouseManager>(context, listen: false);

                  final fullHouseData = houseManager.houses.firstWhere(
                    (h) => h['id'] == widget.id,
                    orElse: () => {},
                  );

                  if (fullHouseData.isNotEmpty) {
                    if (savedManager.savedHouses
                        .any((h) => h['id'] == widget.id)) {
                      savedManager.removeSaved(widget.id);
                    } else {
                      savedManager.addSaved(fullHouseData);
                    }
                  }
                },
                child: Image.asset(
                  savedManager.savedHouses.any((h) => h['id'] == widget.id)
                      ? 'assets/images/save2.png'
                      : 'assets/images/save.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
