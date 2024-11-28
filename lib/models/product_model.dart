import 'dart:convert';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final List<String> images;
  final String categoryName;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.categoryName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<String> parseImages(dynamic images) {
      if (images is List) {
        return List<String>.from(images);
      } else if (images is String) {
        try {
          // Attempt to decode JSON string to List
          return List<String>.from(jsonDecode(images));
        } catch (e) {
          // If not JSON-encoded, return as a single-item list
          return [images];
        }
      }
      return [];
    }

    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      images: parseImages(json['images']),
      categoryName: json['category']['name'],
    );
  }
}
