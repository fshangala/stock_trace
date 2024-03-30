import 'package:flutter/material.dart';
import 'package:stock_trace/core/book.dart';
import 'package:stock_trace/core/file_system_api.dart';
import 'package:stock_trace/core/not_null_future_renderer.dart';
import 'package:stock_trace/core/resolve_future.dart';
import 'package:stock_trace/pages/book_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  Future<List<Book>> booksFuture = FileSystemApi().books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ST"),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              NotNullFutureRenderer(
                future: booksFuture,
                futureRenderer: (books) {
                  return Column(
                    children: books
                        .map(
                          (e) => ListTile(
                            title: Text(e.name),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BookPage(book: e),
                                ),
                              );
                            },
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newBook();
        },
        child: const Text("+"),
      ),
    );
  }

  void newBook() {
    resolveFuture(
      context,
      FileSystemApi().createBook(),
      (value) {
        setState(() {
          booksFuture = FileSystemApi().books;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(value.file.path),
          ),
        );
      },
    );
  }
}
