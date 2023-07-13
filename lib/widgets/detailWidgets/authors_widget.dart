import 'package:app_book/models/book.dart';
import 'package:app_book/services/utils.dart';
import 'package:flutter/material.dart';

class AuthorsWidget extends StatelessWidget {
  final Book book;

  AuthorsWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Utils.listToString(book.authors, '   '),
        textAlign: TextAlign.center,
        style: TextStyle(color: Color(0xFFFE9E3A), fontSize: 12.0),
        softWrap: true,
      ),
    );
  }
}
