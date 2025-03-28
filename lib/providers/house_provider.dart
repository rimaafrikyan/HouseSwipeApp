import 'package:flutter/material.dart';
import 'package:house_swipe_app/screens/home_screen.dart';

class HouseProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _allHouses = HouseData.houses;
  List<Map<String, dynamic>> _likedHouses = [];
  List<Map<String, dynamic>> _dislikedHouses = [];

  List<Map<String, dynamic>> get allHouses => _allHouses;
  List<Map<String, dynamic>> get likedHouses => _likedHouses;
  List<Map<String, dynamic>> get dislikedHouses => _dislikedHouses;

  void likeHouse(Map<String, dynamic> house) {
    _likedHouses.add(house);
    _allHouses.remove(house);
    notifyListeners();
  }

  void dislikeHouse(Map<String, dynamic> house) {
    _dislikedHouses.add(house);
    _allHouses.remove(house);
    notifyListeners();
  }

  void reset() {
    _allHouses = HouseData.houses;
    _likedHouses = [];
    _dislikedHouses = [];
    notifyListeners();
  }
}