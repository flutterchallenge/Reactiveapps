import 'package:flutterapp/model/items.dart';
import 'package:scoped_model/scoped_model.dart';


class ProductModel extends Model {

  final _product = Product();

  List<Product> get items => [ Product(name: "Item", price: 4000), Product(name: "Item", price: 4000), Product(name: "Item", price: 4000), Product(name: "Item", price: 4000), Product(name: "Item", price: 4000), Product(name: "Item", price: 4000), Product(name: "Item", price: 4000)];

  int get count => _product.cartItemList.length;

  addItem(Product p) {
    _product.add(p);
    notifyListeners();
  }

  removeItem(Product p) {
    _product.removeCartItemList(p);
    notifyListeners();
  }
}