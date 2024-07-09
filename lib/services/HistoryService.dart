import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryService {
  static Future<void> saveOperation(String operation) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? history = prefs.getStringList('history') ?? [];
    history.add(operation);
    await prefs.setStringList('history', history);
  }

  static Future<List<String>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('history') ?? [];
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();

  }


}