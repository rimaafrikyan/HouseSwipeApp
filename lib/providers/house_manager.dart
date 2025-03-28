import 'package:flutter/material.dart';

class HouseManager extends ChangeNotifier {
  List<Map<String, dynamic>> houses = [
    {
      'imagePath': 'assets/images/home1.png',
      'title': 'Modern Luxury Home',
      'price': '395.75 UFS',
      'description':
          'Modern luxury home with sleek design, floor-to-ceiling windows, and seamless indoor-outdoor living.',
      'area': '150 square feet',
      'quantity': '2',
      'detailedDescription':
          'Discover this stunning modern architectural masterpiece, featuring sleek geometric design, expansive glass walls, and a spacious open-plan interior. This home offers a seamless indoor-outdoor living experience, with a stylish balcony, high ceilings, and premium finishes. Nestled in a serene neighborhood, it provides the perfect blend of luxury and comfort.',
      'keyFeatures': <String>[
        'Floor-to-ceiling glass windows for natural light',
        'Contemporary open-concept living space',
        'Private balcony with scenic views',
        'Beautiful landscaped garden & walkway',
        '3 bedrooms, 2 bathrooms'
      ],
      'location': 'Yerevan'
    },
    {
      'imagePath': 'assets/images/home2.png',
      'title': 'Elegant Home',
      'price': '500.95 UFS',
      'description':
          'A sophisticated modern home featuring a sleek design, panoramic glass windows, and seamless indoor-outdoor flow.',
      'area': '200 square feet',
      'quantity': '1',
      'detailedDescription':
          'Step into luxury and sophistication with this stunning contemporary home, designed for modern living. Featuring expansive glass walls, a spacious open layout, and a seamless connection to nature, this home offers breathtaking views and a serene atmosphere. With high-end finishes and thoughtful architecture, it’s the perfect blend of style, comfort, and functionality.',
      'keyFeatures': <String>[
        'Floor-to-ceiling windows for abundant natural light',
        'Minimalist yet elegant architecture',
        'Private balcony & outdoor lounge area',
        ' Spacious, open-plan interior with high ceilings',
        '4 bedrooms, 2 bathrooms'
      ],
      'location': 'Yerevan'
    },
    {
      'imagePath': 'assets/images/home3.png',
      'title': 'Modern Home',
      'price': '695.75 UFS',
      'description':
          'A sleek, contemporary home offering a perfect blend of style, comfort, and nature.',
      'area': '180 square feet',
      'quantity': '1',
      'detailedDescription':
          'A sleek, contemporary home offering a perfect blend of style, comfort, and nature.',
      'keyFeatures': <String>[
        'Floor-to-ceiling glass windows for natural light',
        'Contemporary open-concept living space',
        'Private balcony with scenic views',
        'Beautiful landscaped garden & walkway',
        '3 bedrooms, 2 bathrooms'
      ],
      'location': 'Yerevan'
    },
    {
      'imagePath': 'assets/images/home4.png',
      'title': 'Elegant Home',
      'price': '700.95 UFS',
      'description':
          'A sophisticated modern home featuring a sleek design, panoramic glass windows, and seamless indoor-outdoor flow.',
      'area': '200 square feet',
      'quantity': '1',
      'detailedDescription':
          'Step into luxury and sophistication with this stunning contemporary home, designed for modern living. Featuring expansive glass walls, a spacious open layout, and a seamless connection to nature, this home offers breathtaking views and a serene atmosphere. With high-end finishes and thoughtful architecture, it’s the perfect blend of style, comfort, and functionality.',
      'keyFeatures': <String>[
        'Floor-to-ceiling windows for abundant natural light',
        'Minimalist yet elegant architecture',
        'Private balcony & outdoor lounge area',
        ' Spacious, open-plan interior with high ceilings',
        '4 bedrooms, 2 bathrooms'
      ],
      'location': 'Yerevan'
    },
  ];
 List<Map<String, dynamic>> dislikedHouses = [];

void removeAndAddToDisliked(String title) {
  debugPrint('Removing house: $title');
  try {
    final house = houses.firstWhere((h) => h['title'] == title);
    houses.removeWhere((h) => h['title'] == title);
    dislikedHouses.add(house);
    debugPrint('House moved to disliked: ${house['title']}');
    debugPrint('Remaining houses: ${houses.length}');
    debugPrint('Disliked houses: ${dislikedHouses.length}');
    notifyListeners();
  } catch (e) {
    debugPrint('Error removing house: $e');
  }
}

void restoreFromDisliked(String title) {
  try {
    final house = dislikedHouses.firstWhere((h) => h['title'] == title);
    dislikedHouses.removeWhere((h) => h['title'] == title);
    houses.add(house);
    notifyListeners();
    debugPrint('House $title restored from disliked');
  } catch (e) {
    debugPrint('Error restoring house: $e');
  }
}
}