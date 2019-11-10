class Product {
   String name;
   int price;
   Product({ this.name, this.price });

   List<Product> cartItemList = [];

  void add(Product p) {
    cartItemList.add(p);
  }

  void removeCartItemList(Product p) {
    cartItemList.removeWhere((cartProduct) => cartProduct.name == p.name);
  }



}