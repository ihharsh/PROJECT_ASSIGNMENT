import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/product_controller.dart';
import 'ui/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductController()),
      ],
      child: MaterialApp(
        title: 'Product List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductListScreen(),
      ),
    );
  }
}
