import 'package:flutter/material.dart';
import 'package:stock_trace/core/book.dart';
import 'package:stock_trace/core/resolve_future.dart';
import 'package:stock_trace/pages/book_page.dart';

class AddProductPage extends StatefulWidget {
  final Book book;
  const AddProductPage({super.key, required this.book});

  @override
  State<StatefulWidget> createState() {
    return _AddProductPage();
  }
}

class _AddProductPage extends State<AddProductPage> {
  var nameController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: ListView(
        children: [
          Card(
            child: Form(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Name"),
                      ),
                      controller: nameController,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton(
                      child: const Text("Save"),
                      onPressed: () {
                        resolveFuture(
                          context,
                          widget.book.addProduct(
                            name: nameController.text,
                          ),
                          (value) {
                            Navigator.of(context).pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) =>
                                    BookPage(book: widget.book))));
                          },
                          message: "Adding product",
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
