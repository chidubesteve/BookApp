import 'package:app_book/models/book.dart';
import 'package:app_book/providers/bookshelf.dart';
import 'package:app_book/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bookmark extends StatefulWidget {
  final String bookId;
  final Book book;

  Bookmark({required this.bookId, required this.book});

  @override
  _BookmarkState createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<Bookshelf>(context).checkExistingBook(widget.bookId),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return IconButton(
          icon: Icon(
              snapshot.data == true ? Icons.bookmark : Icons.bookmark_border),
          color:  Color(0xFFFE9E3A),
          iconSize: 32,
          onPressed: snapshot.data == true
              ? () async {
                  await Provider.of<Bookshelf>(context, listen: false)
                      .removeSavedBook(widget.bookId);
                  setState(() {});
                }
              : () {
                  Provider.of<Bookshelf>(context, listen: false).addToBookShelf(
                    widget.book.id,
                    widget.book.title,
                    widget.book.thumbnailUrl,
                    Utils.listToString(widget.book.authors, '   '),
                  );
                },
        );
      },
    );
  }
}
