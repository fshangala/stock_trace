import 'package:flutter/material.dart';
import 'package:stock_trace/core/book.dart';

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
                        //
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
