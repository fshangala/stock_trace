import 'package:flutter/material.dart';

class NewBook extends StatefulWidget {
  const NewBook({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewBook();
  }
}

class _NewBook extends State<NewBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Book"),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
