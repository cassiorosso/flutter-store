import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/models/product-model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product', arguments: product),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey[300]) ,
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 4,
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: product.image,
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  placeholder: _loader,
                  errorWidget: _error,
                ),
              ),
            ),
            LayoutBuilder(builder: (_, constraints) {
              return Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.all(3),
                  child: Column(
                    children: <Widget>[
                      Text(
                        product.title,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'R\$ ${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  color: Color(0xFF48A4AF),
                  width: constraints.maxWidth);
            }),
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
