import 'dart:convert';

import 'package:app_book/models/book.dart';
import 'package:app_book/services/utils.dart';
import 'package:http/http.dart' as http;

class BookSearchUtils {
  static Future<Book> fetchBookById(String id) async {
    final url = 'https://www.googleapis.com/books/v1/volumes/$id';

    http.Response response = await http.get(Uri.parse(url));
    print(response);
    var bookMap = await jsonDecode(response.body);
    return Utils.bookFromJson(bookMap);
  }
}
