class Product {
   String name;
   int price;
   List<Product> _productList= [ Product(name: "RAM", price: 4000), Product(name: "RAM", price: 4000), Product(name: "RAM", price: 4000), Product(name: "RAM", price: 4000), Product(name: "RAM", price: 4000), Product(name: "RAM", price: 4000), Product(name: "RAM", price: 4000)];
   Product({ this.name, this.price });

  get items => _productList;


  void add(Product p) {
    _productList.add(p);
  }


}