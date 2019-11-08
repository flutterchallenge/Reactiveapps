import 'package:flutterapp/model/items.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductModel extends Model {

  final _product = Product();

  List<Product> get items => _product.items;

  int get count => _product.items.length;

  addItem(Product p) {
    _product.add(p);
    notifyListeners();
  }
}