import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_store/controllers/cart-controller.dart';
import 'package:flutter_store/models/cart-model.dart';
import 'package:get_it/get_it.dart';

class CartProductTile extends StatelessWidget {
  final CartModel product;
  final int index;
  const CartProductTile({Key key, this.product, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = GetIt.I.call<CartController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(4),
          width: MediaQuery.of(context).size.width * 0.26,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(5)),
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: product.product.image,
            placeholder: _loader,
            errorWidget: _error,
          ),
        ),
        Flexible(
          child: Text(
            "${product.product.title}\n"
            "\$ ${(product.product.price).toStringAsFixed(2)}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          _controller.addProdutcQuantity(index);
                        }),
                    Text(
                      "${product.quantity}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          _controller.removeProdutcQuantity(index);
                        }),
                  ],
                ),
                InkWell(
                  onTap: () {
                    _controller.removeCart(product.product.id);
                  },
                  child: Chip(
                    label: Text("Remove"),
                    avatar: Icon(Icons.delete),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _loader(BuildContext context, String url) => Center(
        child: CircularProgressIndicator(),
      );

  Widget _error(BuildContext context, String url, dynamic error) {
    return Center(child: const Icon(Icons.error));
  }
}
