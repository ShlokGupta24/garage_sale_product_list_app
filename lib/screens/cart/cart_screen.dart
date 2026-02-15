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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Cart'),
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
