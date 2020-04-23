import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_store/controllers/cart-controller.dart';
import 'package:flutter_store/controllers/orders-controller.dart';
import 'package:flutter_store/controllers/products-controller.dart';
import 'package:flutter_store/controllers/user-controller.dart';
import 'package:flutter_store/repositories/nodestr-repository.dart';
import 'package:flutter_store/repositories/shared-preferences-repository.dart';
import 'package:flutter_store/stores/user-store.dart';
import 'package:flutter_store/view/cart-screen.dart';
import 'package:flutter_store/view/confirmedOrder.dart';
import 'package:flutter_store/view/home-screen.dart';
import 'package:flutter_store/view/login-screen.dart';
import 'package:flutter_store/view/order-screen.dart';
import 'package:flutter_store/view/payment-screen.dart';
import 'package:flutter_store/view/product-screen.dart';
import 'package:flutter_store/view/signup-screen.dart';
import 'package:flutter_store/view/splash-screen.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<NodeStrRepository>(
      NodeStrRepository(getIt.call<Dio>()));
  getIt.registerSingleton<SharedPreferencesRepository>(
      SharedPreferencesRepository());
  getIt.registerLazySingleton<UserStore>(() => UserStore());
  getIt.registerSingleton<UserController>(UserController());
  getIt.registerLazySingleton<ProductsController>(() => ProductsController());
  getIt.registerLazySingleton<CartController>(() => CartController());
  getIt.registerLazySingleton<OrdersController>(() => OrdersController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final _userController = GetIt.I.call<UserController>();
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter E-Commerce',
        theme: _userController.themeApp,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(
                savedEmail: ModalRoute.of(context).settings.arguments,
              ),
          '/signup': (context) => SignUpScreen(),
          '/home': (context) => HomeScreen(),
          '/product': (context) =>
              ProductScreen(ModalRoute.of(context).settings.arguments),
          '/cart': (context) => CartScreen(),
          '/payment': (context) => PaymentScreen(),
          '/confirmedOrder': (context) => ConfirmedOrder(),
          '/order': (context) =>
              OrderScreen(order: ModalRoute.of(context).settings.arguments),
        },
      );
    });
  }
}


// void initDio()async{
//  Dio dio = new Dio(); // with default Options

//   // Set default configs
//    dio.options.baseUrl = "http://192.168.1.111:3000";
//   // dio.options.connectTimeout = 5000; //5s
//   // dio.options.receiveTimeout = 3000;

//     Response response = await dio.get("/").catchError((onError)=>print(onError));
//     print(response.data.toString());

// }
