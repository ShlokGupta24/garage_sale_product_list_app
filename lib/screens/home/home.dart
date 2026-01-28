import 'package:flutter/material.dart';
import 'package:garage_sale_product_list_app/screens/cart/cart_screen.dart';
import 'package:garage_sale_product_list_app/shared/cart_icon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garage Sale Products'),
        actions: [CartIcon()],
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: 8,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 20,childAspectRatio: 0.9),
            itemBuilder: (context,index){
            return Container(
              padding: EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.05)
            );
            }
        ),
      )
    );
  }
}
