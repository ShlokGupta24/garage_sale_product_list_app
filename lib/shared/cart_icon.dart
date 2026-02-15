import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garage_sale_product_list_app/providers/cart_provider.dart';
import 'package:garage_sale_product_list_app/screens/cart/cart_screen.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberofItems=ref.watch(cartNotifierProvider).length;
    return Stack(
      children: [
        Hero(tag: 'cart-hero',
          child: IconButton(icon:  Icon(Icons.shopping_cart_outlined),
            onPressed: (){
              Navigator.of(context).push(
                PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation)=> CartScreen(),
                transitionDuration: const Duration(milliseconds: 400),
                  transitionsBuilder: (context,animation, secondaryAnimation,child){
                  const begin=Offset(1.0,0.0);
                  const end=Offset.zero;
                  const curve=Curves.easeInOut;

                  var tween=Tween(begin: begin,end: end,).chain(CurveTween(curve: curve));
                  return SlideTransition(position: animation.drive(tween),child: child,);
                  }

                ),
              );
            },
          ),
        ),
        Positioned(
          top: 5,
          left: 5,
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
      ],
    );
  }
}
