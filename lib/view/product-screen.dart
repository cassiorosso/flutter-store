import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/controllers/cart-controller.dart';
import 'package:flutter_store/models/product-model.dart';
import 'package:flutter_store/view/widgets/custom-bottom.dart';
import 'package:get_it/get_it.dart';

class ProductScreen extends StatelessWidget {
  final ProductModel product;
  final _controller = GetIt.I.call<CartController>();
  ProductScreen(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottom(
         leftColor: Colors.blueGrey,
         leftText: '',
         rightColor: Colors.red[600],
         rightText: 'Add to Cart',
         icon: Icon(Icons.shopping_cart, color: Colors.white, size: 30,),
         onTap: (){
          _controller.addCart(product);
          Navigator.pushNamed(context, '/cart');
         },
       ),
      appBar: AppBar(
        title: Text(
                product.title,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
                tag: product.image,
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  placeholder: _loader,
                  errorWidget: _error,
                )),
            SizedBox(
              height: 5,
            ),
            Text(
              "\$ ${product.price.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8),
              padding: EdgeInsets.all(6),
              color: Theme.of(context).primaryColor,
              child: Text(
                'Descrição',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "${product.description}\n\n",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _loader(BuildContext context, String url) => Center(
        child: CircularProgressIndicator(),
      );

  Widget _error(BuildContext context, String url, dynamic error) {
    return Center(child: const Icon(Icons.error));
  }
}
