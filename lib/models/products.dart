import 'package:avmilvil_p2/models/product.dart';

class Products {
  late List<Product> products;

  Products({required this.products});

  Products.fromJson(Map<String, dynamic> json){
    if(json['products'] != null){
      products = <Product>[];
      json['products'].forEach((v) {products.add(Product.fromJson(v));});
    }
  }
}