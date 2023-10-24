import 'package:flutter/material.dart';

class ProdukProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _products = [];

  List<Map<String, dynamic>> get product => _products;

  void addProduct(Map<String, dynamic> products) {
    _products.add(products);
    notifyListeners();
  }

  void editProduct(Map<String, dynamic> products) {
    final index =
        _products.indexWhere((element) => element['Nama'] == products['Nama']);
    _products[index] = products;
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> products) {
    _products.remove(products);
    notifyListeners();
  }

  void clearProducts() {
    _products.clear();
    notifyListeners();
  }
}
