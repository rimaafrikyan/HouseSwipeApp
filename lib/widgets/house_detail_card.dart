import 'package:flutter/material.dart';
import 'package:house_swipe_app/providers/dislike_manager.dart';
import 'package:house_swipe_app/providers/favorite_manager.dart';
import 'package:house_swipe_app/screens/house_details_screen.dart';
import 'package:provider/provider.dart';

class HouseDetailCard extends StatefulWidget {
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
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    final favoriteManager =
        Provider.of<FavoriteManager>(context); 
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.9;

    isFavorite = favoriteManager.favorites
        .any((house) => house['title'] == widget.title);
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
                        'imagePath': widget.imagePath,
                        'title': widget.title,
                        'price': widget.price,
                      });
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
              
              // Image.asset(
              //   'assets/images/close.png',
              //   width: 40,
              //   height: 40,
              // ),
          
              GestureDetector(
                onTap: () {
                  final dislikeManager =
                      Provider.of<DislikeManager>(context, listen: false);
                  dislikeManager.addDislike({
                    'imagePath': widget.imagePath,
                    'title': widget.title,
                    'price': widget.price,
                  });

                  final favoriteManager =
                      Provider.of<FavoriteManager>(context, listen: false);
                  if (favoriteManager.favorites
                      .any((h) => h['title'] == widget.title)) {
                    favoriteManager.removeFavorite(widget.title);
                    setState(() => isFavorite = false);
                  }
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
      ],
    );
  }
}
