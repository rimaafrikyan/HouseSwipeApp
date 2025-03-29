import 'package:flutter/material.dart';

class DislikeManager extends ChangeNotifier {
  final List<Map<String, dynamic>> _dislikedHouses = [];

  List<Map<String, dynamic>> get dislikes => _dislikedHouses;

  void addDislike(Map<String, dynamic> house) {
    _dislikedHouses.add({
      'id': house['id'],
      'imagePath': house['imagePath'],
      'title': house['title'],
      'price': house['price'] ?? 'Price not set',
    });
    notifyListeners();
  }

  void removeDislike(int id) {
    _dislikedHouses.removeWhere((house) => house['id'] == id);
    notifyListeners();
  }
}
