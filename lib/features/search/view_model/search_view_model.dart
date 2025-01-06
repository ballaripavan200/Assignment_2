import 'package:assignment2/widgets/estate_model.dart';
import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<EstateModel> searchResults = [];
  String searchQuery = "";

  void updateSearchQuery(String query) {
    searchQuery = query;
    fetchSearchResults();
  }

  void fetchSearchResults() async {
    isLoading = true;
    notifyListeners();

    // Simulate API call or database query
    await Future.delayed(const Duration(seconds: 2));

    // Replace with your API data fetching logic
    searchResults = [
      EstateModel(
        title: "Wings Tower",
        price: 220,
        location: "Jakarta, Indonesia",
        imagePath: "assets/Build-3.png",
      ),
      EstateModel(
        title: "Mill Sper House",
        price: 271,
        location: "Jakarta, Indonesia",
        imagePath: "assets/Build-4.png",
      ),
    ].where((estate) {
      return estate.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    isLoading = false;
    notifyListeners();
  }
}