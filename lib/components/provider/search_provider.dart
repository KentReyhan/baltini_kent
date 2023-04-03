import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String? searchInput;

  onChangeSearchInput(String value) {
    searchInput = value;
    notifyListeners();
  }
}
