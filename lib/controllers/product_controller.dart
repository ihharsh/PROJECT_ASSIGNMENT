import 'package:flutter/material.dart';
import '../data/api_service.dart';
import '../models/product_model.dart';

class ProductController with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Product> _products = [];
  bool _isLoading = true;
  String _errorMessage = '';

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  ProductController() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _products = await _apiService.fetchProducts();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
