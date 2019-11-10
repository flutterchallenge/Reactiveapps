import 'package:badges/badges.dart';
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
        appBar: AppBar(
          title: Text("ScopeModel sample"),
          centerTitle: true,
          actions: <Widget>[
            ScopedModelDescendant<ProductModel>( builder: (context, _, product) =>
                Container(
                  margin: EdgeInsets.only(top: 8.0, right: 16.0),
                  child: Badge(
                    badgeColor: Colors.deepPurple,
                    shape: BadgeShape.circle,
                    borderRadius: 20,
                    toAnimate: true,
                    child: Icon(Icons.shopping_cart),
                    animationType: BadgeAnimationType.slide,
                    badgeContent:
                    Text('${product.count}', style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Press any item of the list and see how the notification item count change without loading the widget tree", style: TextStyle(fontSize: 16.0),),
            ),
            SizedBox(height: 8.0,),
            ScopedModelDescendant<ProductModel>(
            rebuildOnChange: false,
            builder: (context, _, product) => Container(
              height: MediaQuery.of(context).size.height*0.75,
              child: GridView.count(
                crossAxisCount: 3,
                children: List<Widget>.generate(
                    product.items.length,
                    (index) => InkWell(
                      onTap: () {
                        product.addItem(product.items[index]);
                      },
                      child: Container(
                        margin: EdgeInsets.all(4.0),
                        color: Colors.green,
                        child: Center(
                              child: Text(
                                "${product.items[index].name} $index",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                      ),
                    )),
              ),
            ),
          )],
        ));
  }
}
