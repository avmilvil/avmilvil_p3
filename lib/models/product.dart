class Product {
  late String name;
  late double price;
  late String image;
  late String description;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  Product.fromJson(Map<String, dynamic> json){
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }

}