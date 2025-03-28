import 'dart:convert';
import 'package:flutter/services.dart';

class LanguageService {
  static Future<Map<String, dynamic>> loadLanguage(String locale) async {
    String jsonString = await rootBundle.loadString('assets/translations/$locale.json');
    return json.decode(jsonString);
  }
}