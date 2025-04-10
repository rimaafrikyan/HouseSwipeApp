import 'package:flutter/foundation.dart';

class HouseManager extends ChangeNotifier {
  List<Map<String, dynamic>> houses = [
    {
      'id': 1,
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
      'id': 2,
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
      'id': 3,
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
      'id': 4,
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
    {
      'id': 5,
      'imagePath': 'assets/images/home5.png',
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
      'id': 6,
      'imagePath': 'assets/images/home6.png',
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
      'id': 7,
      'imagePath': 'assets/images/home7.png',
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
      'id': 8,
      'imagePath': 'assets/images/home8.png',
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
  List<Map<String, dynamic>> favoriteHouses = [];
  List<Map<String, dynamic>> savedHouses = [];

  final _favoriteIds = <int>{};
  final _savedIds = <int>{};

  void removeHouse(int id) {
    houses.removeWhere((house) => house['id'] == id);
    notifyListeners();
    debugPrint('House $id completely removed');
  }

  void removeAndAddToDisliked(int id) {
    try {
      if (_favoriteIds.contains(id)) {
        favoriteHouses.removeWhere((h) => h['id'] == id);
        _favoriteIds.remove(id);
        debugPrint('Removed house $id from favorites');
      }

      final house = houses.firstWhere((h) => h['id'] == id);

      houses.removeWhere((h) => h['id'] == id);
      dislikedHouses.add(house);

      notifyListeners();
      debugPrint('House $id moved to disliked');
    } catch (e) {
      debugPrint('Error removing house: $e');
      rethrow;
    }
  }

  void restoreFromDisliked(int id) {
    try {
      final house = dislikedHouses.firstWhere((h) => h['id'] == id);
      dislikedHouses.removeWhere((h) => h['id'] == id);
      houses.add(house);
      notifyListeners();
      debugPrint('House $id restored from disliked');
    } catch (e) {
      debugPrint('Error restoring house: $e');
    }
  }

  void addToDislikedIfNotExists(int id, Map<String, dynamic> houseData) {
    try {
      if (dislikedHouses.any((h) => h['id'] == id)) {
        debugPrint('House $id is already in disliked list');
        return;
      }

      if (_favoriteIds.contains(id)) {
        favoriteHouses.removeWhere((h) => h['id'] == id);
        _favoriteIds.remove(id);
        debugPrint('Removed house $id from favorites');
      }

      if (houses.any((h) => h['id'] == id)) {
        removeAndAddToDisliked(id);
      } else {
        dislikedHouses.add(houseData);
        notifyListeners();
        debugPrint('House $id added to disliked');
      }
    } catch (e) {
      debugPrint('Error adding to disliked: $e');
      rethrow;
    }
  }

  void addToFavorites(int id) {
    try {
      if (_favoriteIds.contains(id)) return;

      final house = findHouseById(id);
      if (house == null) {
        debugPrint('House $id not found in any list');
        return;
      }

      final fromDisliked = dislikedHouses.any((h) => h['id'] == id);

      favoriteHouses.add(Map<String, dynamic>.from(house));
      _favoriteIds.add(id);

      if (fromDisliked) {
        dislikedHouses.removeWhere((h) => h['id'] == id);
        debugPrint('Removed house $id from disliked list');
      }

      if (!houses.any((h) => h['id'] == id)) {
        houses.add(Map<String, dynamic>.from(house));
        debugPrint('Added house $id to main houses list');
      }

      notifyListeners();
      debugPrint('House $id added to favorites');
    } catch (e) {
      debugPrint('Error adding to favorites: $e');
      rethrow;
    }
  }

  void removeFromFavorites(int id) {
    favoriteHouses.removeWhere((house) => house['id'] == id);
    _favoriteIds.remove(id);
    _ensureHouseInMainList(id);
    notifyListeners();
    debugPrint('House $id removed from favorites');
  }

  bool isFavorite(int id) {
    assert(id != null, 'House ID cannot be null');
    return _favoriteIds.contains(id);
  }

  void toggleFavorite(int id) {
    if (isFavorite(id)) {
      removeFromFavorites(id);
    } else {
      addToFavorites(id);
    }
  }

  void clearFavorites() {
    favoriteHouses.clear();
    _favoriteIds.clear();
    notifyListeners();
    debugPrint('All favorites cleared');
  }

  void addToSaved(int id) {
    try {
      if (_savedIds.contains(id)) return;

      final house = findHouseById(id);
      if (house == null) {
        debugPrint('House $id not found in any list');
        return;
      }

      savedHouses.add(Map<String, dynamic>.from(house));
      _savedIds.add(id);
      notifyListeners();
      debugPrint('House $id added to saved');
    } catch (e) {
      debugPrint('Error adding to saved: $e');
      rethrow;
    }
  }

  void removeFromSaved(int id) {
    savedHouses.removeWhere((house) => house['id'] == id);
    _savedIds.remove(id);
    _ensureHouseInMainList(id);
    notifyListeners();
    debugPrint('House $id removed from saved');
  }

  bool isSaved(int id) {
    assert(id != null, 'House ID cannot be null');
    return _savedIds.contains(id);
  }

  void toggleSaved(int id) {
    if (isSaved(id)) {
      removeFromSaved(id);
    } else {
      addToSaved(id);
    }
  }

  void clearSaved() {
    savedHouses.clear();
    _savedIds.clear();
    notifyListeners();
    debugPrint('All saved houses cleared');
  }

  Map<String, dynamic>? findHouseById(int id) {
    final allLists = [houses, favoriteHouses, dislikedHouses, savedHouses];

    for (final list in allLists) {
      try {
        return list.firstWhere((h) => h['id'] == id);
      } catch (e) {
        continue;
      }
    }
    debugPrint('House $id not found in any list');
    return null;
  }

  void _ensureHouseInMainList(int id) {
    if (houses.any((h) => h['id'] == id)) return;

    final house = findHouseById(id);
    if (house != null) {
      houses.add(Map<String, dynamic>.from(house));
      notifyListeners();
      debugPrint('House $id added to main list from other lists');
    } else {
      debugPrint('House $id not found in any list to restore to main');
    }
  }

  Future<void> loadHouses() async {
    try {
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading houses: $e');
      rethrow;
    }
  }
}
