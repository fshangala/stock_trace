import 'package:stock_trace/product.dart';

class Sale {
  Product product;

  Sale({required this.product});

  Sale.fromMap(Map<String, dynamic> data) : product = data["product"];

  Map<String, dynamic> toMap() {
    return {"product": product};
  }
}
