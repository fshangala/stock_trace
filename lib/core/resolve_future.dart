import 'package:flutter/material.dart';
import 'package:stock_trace/core/loading_dialog.dart';

void resolveFuture<T>(
    BuildContext context, Future<T> future, void Function(T value) callback,
    {String message = 'Loading'}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return LoadingDialog(messageText: message);
    },
  );
  future.then((value) {
    Navigator.pop(context);
    if (value == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed"),
        ),
      );
    } else {
      callback(value);
    }
  }).onError((error, stackTrace) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        leading: const Icon(Icons.error),
        content: Text('Error: $error'),
        actions: [
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Icon(Icons.close),
          )
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error: $error'),
      ),
    );
  });
}
