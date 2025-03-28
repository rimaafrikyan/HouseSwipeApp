import 'package:flutter/material.dart';

class HouseLekedCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final Color backgroundColor;
  final double imageWidth;
  final double imageHeight;
  final double iconSize;
  final double fontSize;

  const HouseLekedCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    this.backgroundColor = const Color.fromARGB(152, 50, 64, 89),
    this.imageWidth = 100,
    this.imageHeight = 100,
    this.iconSize = 30,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: fontSize - 2,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Positioned(
          //   right: 10,
          //   bottom: 10,
          //   child: _getIcon(),
          // ),
        ],
      ),
    );
  }

  // Widget _getIcon() {
  //   return Image.asset(
  //     isLiked
  //       ? 'assets/images/favorite2.png'
  //       : 'assets/images/delete.png',
  //     width: iconSize,
  //     height: iconSize,
  //   );
  // }
}
