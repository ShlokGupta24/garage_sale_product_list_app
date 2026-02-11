import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garage_sale_product_list_app/providers/cart_provider.dart';
import 'package:garage_sale_product_list_app/providers/products_provider.dart';
import 'package:garage_sale_product_list_app/screens/cart/cart_screen.dart';
import 'package:garage_sale_product_list_app/shared/cart_icon.dart';
//For providers we need to use Consumer widget class.
class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final allProducts=ref.watch(productsProvider);
    final cartProducts=ref.watch(cartNotifierProvider);
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
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
              color: Colors.blueGrey.withOpacity(0.05),
                child: Column(
                children: [
                  Image.asset(allProducts[index].image,width: 55,height: 55,),
                  Text(allProducts[index].title),
                  Text('\$${allProducts[index].price}'),
                  
                  if(cartProducts.contains(allProducts[index]))
                    TextButton(onPressed: (){
                      ref.read(cartNotifierProvider.notifier)
                          .removeProduct(allProducts[index]);
                    },
                        child: const Text('Remove')),
                  
                  if(!cartProducts.contains(allProducts[index]))
                    TextButton(onPressed: (){
                      ref.read(cartNotifierProvider.notifier)
                          .addProduct(allProducts[index]);
                    },
                        child: const Text('Add to cart'))

                ],
            ),
            );
            }
        ),
      )
    );
  }
}
