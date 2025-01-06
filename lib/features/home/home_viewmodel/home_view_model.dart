import 'package:assignment2/widgets/estate/estatecard.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<Estate> _featuredEstates = [];
  bool _isLoading = false;

  List<Estate> get featuredEstates => _featuredEstates;
  bool get isLoading => _isLoading;

  void fetchFeaturedEstates() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    _featuredEstates = [
      Estate(
        title: "Modern Apartment",
        location: "New York, USA",
        price: "\$2500/month",
        imagePath: "assets/Build-1.png",
      ),
      Estate(
        title: "Luxury Villa",
        location: "Bali, Indonesia",
        price: "\$450/night",
        imagePath: "assets/Build-2.png",
      ),
      Estate(
        title: "Cozy Cottage",
        location: "Switzerland",
        price: "\$300/night",
        imagePath: "assets/Build-3.png",
      ),
      Estate(
        title: "Beachfront Estate",
        location: "Malibu, California",
        price: "\$5000/night",
        imagePath: "assets/Build-4.png",
      ),
    ];
    _isLoading = false;
    notifyListeners();
  }
}
