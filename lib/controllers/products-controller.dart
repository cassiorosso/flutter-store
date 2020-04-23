import 'package:flutter_store/models/product-model.dart';
import 'package:flutter_store/repositories/nodestr-repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'products-controller.g.dart';

class ProductsController = _ProductsControllerBase with _$ProductsController;

abstract class _ProductsControllerBase with Store {
  final _repository = GetIt.I.call<NodeStrRepository>();

  @observable
  ObservableList<ProductModel> products = ObservableList();

  @action
  Future<void> getProducts()async{
    await _repository.getProducts().then((produtos) => products = produtos.asObservable());   
  }

  _ProductsControllerBase(){
    getProducts();
  }
  
}