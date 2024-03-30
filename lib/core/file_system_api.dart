import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:stock_trace/core/book.dart';

class FileSystemApi {
  Future<Directory> get booksDirectory async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    Directory books = Directory("${documentsDirectory.path}/books");
    if (await books.exists() == false) {
      await books.create();
    }
    return books;
  }

  Future<List<Book>> get books async {
    Directory directory = await booksDirectory;
    List<FileSystemEntity> bookEntities = await directory.list().toList();
    List<File> bookFiles =
        bookEntities.map((e) => File.fromUri(e.uri)).toList();
    return bookFiles.map((e) => Book(file: e)).toList();
  }

  Future<Book> createBook() async {
    String name = DateTime.now().toString();
    BookData bookData = BookData();
    Directory dir = await booksDirectory;
    File file = File("${dir.path}/$name.json");
    file = await file.writeAsString(jsonEncode(bookData.toMap()));
    return Book(file: file);
  }
}
