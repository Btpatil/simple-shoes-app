import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shoes_app/cart_provider.dart';
import 'package:simple_shoes_app/global_variables.dart';
import 'package:simple_shoes_app/home_page.dart';
import 'package:simple_shoes_app/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CartProvider();
      },
      child: MaterialApp(
        title: "shopping app",
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.yellow,
            primary: Colors.yellow,
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 22,
              color: Colors.black,
            ),
            centerTitle: true,
          ),
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
