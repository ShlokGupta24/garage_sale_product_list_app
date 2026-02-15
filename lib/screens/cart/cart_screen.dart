import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garage_sale_product_list_app/providers/cart_provider.dart';
import 'package:garage_sale_product_list_app/providers/products_provider.dart';
//For state changes and using providers also, we need ConsumerStateful Widget for it.
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon=true;

  @override
  Widget build(BuildContext context) {
    final cartProducts=ref.watch(cartNotifierProvider);
    final total=ref.watch(cartTotalProvider);
    final numberofItems=ref.watch(cartNotifierProvider).length;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Cart'),
        actions: [
          Stack(
            clipBehavior: Clip.none,
              children: [
                Hero(tag: 'cart-hero', child: Icon(Icons.shopping_cart_outlined,)),
                Positioned(
                  top: -8,
                  left: -6,
                  child: Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent,
                    ),
                    child: Text(numberofItems.toString(),style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                )
              ]
          ),
          SizedBox(width: 10,)
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProducts.map((products){
                return Container(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                    children: [
                      Image.asset(products.image,width: 60,height: 60,),
                      SizedBox(width: 10,),
                      Text('${products.title}...'),
                      Expanded(child: SizedBox()),
                      Text('\$${products.price}'),
                    ],
                  ),
                );
              }).toList(),
            ),
            Text('Total price - \$$total'),
          ],
        ),
      ),
    );
  }
}
