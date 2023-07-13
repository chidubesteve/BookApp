import 'package:app_book/providers/bookshelf.dart';
import 'package:app_book/widgets/navbar.dart';
import 'package:app_book/widgets/saved_book_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class BookShelfScreen extends StatefulWidget {
  static const routeName = '/bookshelf';

  @override
  _BookShelfScreenState createState() => _BookShelfScreenState();
}

class _BookShelfScreenState extends State<BookShelfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131E32),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NavBar(BookShelfScreen.routeName),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
          return Future.delayed(Duration.zero);
        },
        child: Consumer<Bookshelf>(
          builder: (BuildContext context, bookshelf, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Material(
                  elevation: 2,
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/books_title.jpg"),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(Colors.black87, BlendMode.overlay))),
                    child: Container(
                      color: Colors.black38,
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 0, left: 16.0, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Bookshelf',
                                textAlign: TextAlign.end,
                                style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
//                Divider(
//                  height: 0,
//                ),
                Expanded(
                  child: FutureBuilder(
                    future: Provider.of<Bookshelf>(context, listen: false)
                        .fetchAndSetBooks(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const Center(child: CircularProgressIndicator())
                          : bookshelf.savedBooks.length <= 0
                              ? EmptyBookshelfWidget()
                              : ListView.builder(
                                  itemCount: bookshelf.savedBooks.length,
                                  itemBuilder: (ctx, i) => SavedBookItem(
                                      bookshelf.savedBooks.reversed
                                          .toList()[i]),
                                );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class EmptyBookshelfWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: "Click ",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            WidgetSpan(
              child: Icon(
                Icons.bookmark_border,
                size: 18,
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: " to add books to the bookshelf",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
