import 'package:flutter/material.dart';
import 'package:flutterapp/scopemodel/prodduct_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProductModel _productModel = ProductModel();
    return ScopedModel(
      model: _productModel,
      child: ItemList(),
    );
  }
}

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ItemList sample"), centerTitle: true, actions: <Widget>[
        Stack( children: [ Icon(Icons.add_shopping_cart), Align( alignment: Alignment.topRight, child: Text("1"),)])
      ],),
      body: ScopedModelDescendant<ProductModel>(builder: (context, _, product) => ListView.builder(
          itemCount: product.items.length,
          itemBuilder: (context, pos) {

      }),
    ));
  }
}

