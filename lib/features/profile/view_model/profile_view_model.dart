import 'package:assignment2/utils/images_const.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  String userName = "Mathew Adam";
  String email = "mathew@email.com";
  int listings = 30;
  int sold = 12;
  int reviews = 28;
  bool isLoading = false;

  List<Transaction> transactions = [];

  ProfileViewModel() {
    _fetchUserData();
    _fetchTransactions();
  }

  void _fetchUserData() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    notifyListeners();
  }

  void _fetchTransactions() {
    transactions = [
      Transaction(
        title: "Wings Tower",
        date: "November 23, 2021",
        imagePath: ImagesConst.build_1,
        tag: "Rent",
      ),
      Transaction(
        title: "Bridgeland Modern House",
        date: "December 17, 2021",
        imagePath: ImagesConst.build_2,
        tag: "Rent",
      ),
    ];
    notifyListeners();
  }
}

class Transaction {
  final String title;
  final String date;
  final String imagePath;
  final String tag;

  Transaction({
    required this.title,
    required this.date,
    required this.imagePath,
    required this.tag,
  });
}