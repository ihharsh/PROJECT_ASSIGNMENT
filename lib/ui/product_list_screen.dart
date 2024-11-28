import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/product_controller.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: productController.isLoading
          ? const Center(child: CircularProgressIndicator())
          : productController.errorMessage.isNotEmpty
          ? Center(child: Text(productController.errorMessage))
          : ListView.builder(
        itemCount: productController.products.length,
        itemBuilder: (context, index) {
          final product = productController.products[index];
          return ListTile(
            leading: Image.network(
              product.images.isNotEmpty ? product.images.first : 'https://via.placeholder.com/150',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image_not_supported);
              },
            ),
            title: Text(product.title),
            subtitle: Text('\$${product.price}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
          )
          ;
        },
      ),
    );
  }
}
