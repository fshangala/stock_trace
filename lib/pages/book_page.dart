import 'package:flutter/material.dart';
import 'package:stock_trace/core/book.dart';
import 'package:stock_trace/pages/add_product_page.dart';

class BookPage extends StatefulWidget {
  final Book book;
  const BookPage({super.key, required this.book});

  @override
  State<StatefulWidget> createState() {
    return _BookPage();
  }
}

class _BookPage extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.book.name),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.shopping_bag),
                text: "Products",
              ),
              Tab(
                icon: Icon(Icons.monetization_on),
                text: "Sales",
              ),
              Tab(
                icon: Icon(Icons.storage),
                text: "Suplies",
              ),
              Tab(
                icon: Icon(Icons.money),
                text: "Expenses",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    child: const Text("+ Product"),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AddProductPage(
                                book: widget.book,
                              )));
                    },
                  ),
                )
              ],
            ),
            ListView(),
            ListView(),
            ListView(),
          ],
        ),
      ),
    );
  }
}
