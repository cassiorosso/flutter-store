import 'package:flutter_store/models/cart-model.dart';
import 'package:flutter_store/models/order-model.dart';
import 'package:flutter_store/models/product-model.dart';
import 'package:flutter_store/repositories/nodestr-repository.dart';
import 'package:flutter_store/stores/user-store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'cart-controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  final _repository = GetIt.I.call<NodeStrRepository>();
  final _user = GetIt.I.call<UserStore>();

  @observable
  ObservableList<CartModel> cart = ObservableList();

  @observable
  double shipPrice = 0;

  @computed
  double get totalPrice{
    double total = 0;
    cart.forEach((item){
      total = total + item.product.price * item.quantity;
    });
    total = total + shipPrice;
    return total;
  }

  @action
  void addCart(ProductModel product){
    bool _sameProduct = false;
    cart.forEach((item){
      if(item.product.id == product.id){
      _sameProduct = true;
    }});
    if(_sameProduct == false){
    CartModel newProduct = CartModel(product: product, quantity: 1, price: product.price);
    cart.add(newProduct);
  }}

  @action
  void removeCart(String id){
    cart.removeWhere((item) => item.product.id == id
    );
  }

  @action
  void cleanCart(){
    cart.clear();
  }

  @action 
  void addProdutcQuantity(int index){
    cart[index].quantity = cart[index].quantity + 1 ;
    cart = cart;
  }

  @action 
  void removeProdutcQuantity(int index){
    if(cart[index].quantity != 1){
      cart[index].quantity = cart[index].quantity - 1 ;
      cart = cart;
    }
  }

  @action
  void shippingMethod(bool free){
    free == true ? shipPrice = 0 : shipPrice = 10;
  } 

  Future<String> finishOrder()async{
    String customerToken = _user.user.token;
    OrderModel order = OrderModel(items: cart, shipPrice: shipPrice, totalPrice: totalPrice);
    return await _repository.makeOrder(order, customerToken);
  } 
  
}