import 'package:flutter/foundation.dart';

class FavoriteManager extends ChangeNotifier {
  final List<Map<String, dynamic>> _favoriteHouses = [];

  List<Map<String, dynamic>> get favorites => _favoriteHouses;

  void addFavorite(Map<String, dynamic> house) {
    assert(house['id'] != null, 'ID is required');
    assert(house['imagePath'] != null, 'Image path is required');
    assert(house['title'] != null, 'Title is required');

    _favoriteHouses.add({
      'id': house['id'],
      'imagePath': house['imagePath'],
      'title': house['title'],
      'price': house['price'] ?? 'Price not set',
    });
    notifyListeners();
  }

  void removeFavorite(int id) {
    _favoriteHouses.removeWhere((house) => house['id'] == id);
    notifyListeners();
  }

  bool isFavorite(int id) {
    return _favoriteHouses.any((house) => house['id'] == id);
  }

  void clearAll() {
    _favoriteHouses.clear();
    notifyListeners();
  }
}
