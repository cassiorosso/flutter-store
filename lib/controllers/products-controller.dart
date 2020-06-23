import 'package:flutter_store/interfaces/nodestr-interface.dart';
import 'package:flutter_store/models/product-model.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'products-controller.g.dart';

class ProductsController = _ProductsControllerBase with _$ProductsController;

abstract class _ProductsControllerBase with Store {
  final _repository = GetIt.I.call<INodeStr>();
  bool isLoading = true;

  @observable
  ObservableList<ProductModel> products = ObservableList();

  @action
  Future<void> getProducts() async {
    await _repository.getProducts().then((produtos) {
      isLoading = false;
      if (produtos != null)
        products = produtos.asObservable();
      else
      products = null;
    });
  }

  _ProductsControllerBase() {
    getProducts();
  }
}
