
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garage_sale_product_list_app/model/product.dart';

class CartNotifier extends Notifier<Set<Product>>{
  //initial value
  @override
  Set<Product> build(){
    return const{
   Product(id: '4', title: 'Red Backpack', image: 'assets/backpack.png', price: 14)
    };
  }
  //methods to update state
void addProduct(Product product){
    if(!state.contains(product)){
      state={...state,product};
    }
}
void removeProduct(Product product){
    if(state.contains(product)){
      state=state.where((p)=> p.id != product.id).toSet();
    }
}
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>((){
  return CartNotifier();
});