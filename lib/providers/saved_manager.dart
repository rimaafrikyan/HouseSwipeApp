import 'package:flutter/foundation.dart';

class SavedManager extends ChangeNotifier {
  final List<Map<String, dynamic>> _savedHouses = [];

  List<Map<String, dynamic>> get savedHouses => _savedHouses;

 void addSaved(Map<String, dynamic> house) {
  if (!_savedHouses.any((h) => h['id'] == house['id'])) {
    _savedHouses.add(Map<String, dynamic>.from(house));
    notifyListeners();
  }
}

  void removeSaved(int id) {
    _savedHouses.removeWhere((house) => house['id'] == id);
    notifyListeners();
  }

  bool isSaved(int id) {
    return _savedHouses.any((house) => house['id'] == id);
  }
}