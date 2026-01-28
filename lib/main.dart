import 'package:flutter/material.dart';
import 'package:garage_sale_product_list_app/screens/cart/cart_screen.dart';
import 'package:garage_sale_product_list_app/screens/home/home.dart';

void main() {
  runApp(MaterialApp(
   title: '',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)
    ),
    home: const Home(),
    routes: {
     '/cartscreen':(context)=> CartScreen(),
      '/home':(context)=>Home()
    },
  ));
}
