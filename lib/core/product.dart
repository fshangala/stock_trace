class Product {
  String name;

  Product({required this.name});

  Product.fromMap(Map<String, dynamic> data) : name = data["name"];

  Map<String, dynamic> toMap() {
    return {
      "name": name,
    };
  }
}
