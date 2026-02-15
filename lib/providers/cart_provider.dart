import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:garage_sale_product_list_app/model/product.dart';
part 'cart_provider.g.dart';
@riverpod
class CartNotifier extends _$CartNotifier{
  //initial value
   @override
   Set<Product> build(){
    return const{
  //  Product(id: '4', title: 'Red Backpack', image: 'assets/backpack.png', price: 14)
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

@riverpod
int cartTotal(Ref ref) {
  final cartProducts = ref.watch(cartNotifierProvider);

  int total=0;

  for(Product product in cartProducts){
    total+=product.price;
  }
  return total;
}