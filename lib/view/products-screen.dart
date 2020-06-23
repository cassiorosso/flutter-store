import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_store/controllers/products-controller.dart';
import 'package:flutter_store/view/widgets/product-card.dart';
import 'package:get_it/get_it.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = GetIt.I.call<ProductsController>();
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSWMU35DYVmLOuoQfVoQrkZMt2grLE6D88BB2v_0PoB7lN5KtTE&usqp=CAU',
              fit: BoxFit.cover,
            ),
          ),
          snap: true,
          floating: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.23,
          //backgroundColor: Colors.red[300],
        ),
        Observer(builder: (_) {
          if (_controller.products == null && _controller.isLoading == true)
            return SliverToBoxAdapter(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("\n\n\n\n"),
                Center(child: CircularProgressIndicator()),
              ],
            ));
          else if (_controller.products == null &&
              _controller.isLoading == false)
            return SliverToBoxAdapter(
                child: Column(
              children: <Widget>[
                Image.asset("images/wrong-connection.jpg", fit: BoxFit.cover, scale: .5,),
                IconButton(icon: Icon(Icons.refresh, color: Colors.blue,), onPressed: (){
                  _controller.getProducts();
                }),
                Text("Refresh", style: TextStyle(color: Colors.blue),)
              ],
            ));
          else if (_controller.products.isEmpty)
            return SliverToBoxAdapter(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("\n\n\n\n"),
                Center(child: CircularProgressIndicator()),
              ],
            ));
          else
            return SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return ProductCard(_controller.products[index]);
                }, childCount: _controller.products.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2));
        })
      ],
    );
  }
}
