import 'dart:convert';
import 'dart:io';

import 'package:stock_trace/core/expense.dart';
import 'package:stock_trace/core/product.dart';
import 'package:stock_trace/core/sale.dart';
import 'package:stock_trace/core/suply.dart';

class BookData {
  List<Product> products;
  List<Sale> sales;
  List<Suply> suplies;
  List<Expense> expenses;
  BookData({
    this.products = const [],
    this.sales = const [],
    this.suplies = const [],
    this.expenses = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      "products": products.map((e) => e.toMap()).toList(),
    };
  }
}

class Book {
  File file;
  Book({required this.file});

  String get name {
    return file.uri.pathSegments[file.uri.pathSegments.length - 1];
  }

  Future<BookData> get data async {
    String fileContent = await file.readAsString();
    var mapData = jsonDecode(fileContent) as Map<String, dynamic>;
    return BookData(
      products: (mapData["products"] as List)
          .map((e) => Product.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Future<BookData> addProduct({required String name}) async {
    var product = Product(name: name);
    var bookData = await data;
    bookData.products.add(product);
    await file.writeAsString(jsonEncode(bookData.toMap()));
    return await data;
  }
}
