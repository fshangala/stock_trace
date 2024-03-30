import 'package:flutter/material.dart';
import 'package:stock_trace/core/book.dart';
import 'package:stock_trace/core/not_null_future_renderer.dart';
import 'package:stock_trace/core/resolve_future.dart';
import 'package:stock_trace/pages/add_product_page.dart';

class BookPage extends StatefulWidget {
  final Book book;
  final int initialTabIndex;
  const BookPage({super.key, required this.book, this.initialTabIndex = 0});

  @override
  State<StatefulWidget> createState() {
    return _BookPage();
  }
}

class _BookPage extends State<BookPage> {
  late Future<BookData> bookDataFuture;

  @override
  void initState() {
    super.initState();
    bookDataFuture = widget.book.data;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: widget.initialTabIndex,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.book.name),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                switch (value) {
                  case "delete":
                    resolveFuture(context, widget.book.file.delete(), (value) {
                      Navigator.of(context).pop();
                    });
                    break;
                  default:
                }
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<String>(
                    value: "delete",
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        Text("Delete book"),
                      ],
                    ),
                  )
                ];
              },
            ),
          ],
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
                ),
                NotNullFutureRenderer(
                  future: bookDataFuture,
                  futureRenderer: (value) {
                    return Column(
                      children: value.products
                          .map((e) => ListTile(
                                title: Text(e.name),
                              ))
                          .toList(),
                    );
                  },
                ),
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
