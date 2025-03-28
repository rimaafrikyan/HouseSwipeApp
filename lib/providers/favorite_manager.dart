import 'package:flutter/foundation.dart';

class FavoriteManager extends ChangeNotifier {
  final List<Map<String, dynamic>> _favoriteHouses = [];

  List<Map<String, dynamic>> get favorites => _favoriteHouses;

  void addFavorite(Map<String, dynamic> house) {
    assert(house['imagePath'] != null, 'Image path is required');
    assert(house['title'] != null, 'Title is required');

    _favoriteHouses.add({
      'imagePath': house['imagePath'],
      'title': house['title'],
      'price': house['price'] ?? 'Price not set',
      'addedAt': DateTime.now(),
    });
    notifyListeners();
  }

  void removeFavorite(String title) {
    _favoriteHouses.removeWhere((house) => house['title'] == title);
    notifyListeners();
  }

  bool isFavorite(String title) {
    return _favoriteHouses.any((house) => house['title'] == title);
  }

  void clearAll() {
    _favoriteHouses.clear();
    notifyListeners();
  }
}
