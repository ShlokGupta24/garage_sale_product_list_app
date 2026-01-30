import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garage_sale_product_list_app/providers/products_provider.dart';
import 'package:garage_sale_product_list_app/screens/cart/cart_screen.dart';
import 'package:garage_sale_product_list_app/shared/cart_icon.dart';
//For providers we need to use Consumer widget class.
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final allProducts=ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Garage Sale Products'),
        actions: [CartIcon()],
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 20,childAspectRatio: 0.9),
            itemBuilder: (context,index){
            return Container(
              padding: EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.05),
                child: Column(
                children: [
                  Image.asset(allProducts[index].image,width: 60,height: 60,),
                  Text(allProducts[index].title),
                  Text('\$${allProducts[index].price}'),

                ],
            ),
            );
            }
        ),
      )
    );
  }
}
