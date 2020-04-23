import 'package:mobx/mobx.dart';
part 'payment-controller.g.dart';

class PaymentController = _PaymentControllerBase with _$PaymentController;

abstract class _PaymentControllerBase with Store {

  @observable
  String paymentMethod = "null";

  @action 
  void choosePayment(int i){
    switch (i){
      case 0:
      paymentMethod = "money";
      break;
      case 1:
      paymentMethod = "card";
      break;
      case 2:
      paymentMethod = "pick";
      break;
      case 3:
      paymentMethod = "null";
    }
  }
  
}