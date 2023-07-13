import 'package:app_book/models/book.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';

class DescriptionWidget extends StatelessWidget {
  final Book book;

  DescriptionWidget(this.book);

  String _parseHtmlString(String htmlString) {
    var document = parse(htmlString);

    String parsedString = parse(document.body?.text).documentElement!.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2F4D),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'DESCRIPTION',
              style: TextStyle(
                  color: Color(0xFFFE9E3A),
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                    child: Text(
                  _parseHtmlString(book.description),
                  style: GoogleFonts.notoSans(
                      textStyle: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 0.2,
                        color: Colors.grey
                  )),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
