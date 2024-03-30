import 'package:flutter/material.dart';

class NewBookForm extends StatefulWidget {
  const NewBookForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewBookForm();
  }
}

class _NewBookForm extends State<NewBookForm> {
  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    return Form(
      key: _key,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text("Book name"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
