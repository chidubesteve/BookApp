import 'package:app_book/providers/books.dart';
import 'package:app_book/widgets/books_grid.dart';
import 'package:app_book/widgets/navbar.dart';
import 'package:app_book/widgets/network_sensititve.dart';
import 'package:app_book/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool loadGrid = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Books>(context, listen: false).clearList();
      setState(() {
        loadGrid = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131E32),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NavBar(SearchScreen.routeName),
      body: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 190,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/books_title.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black87, BlendMode.overlay))),
                child: Container(
                  color: Colors.black38,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 32.0, left: 16.0, right: 16.0, bottom: 2.0),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Book Search!',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            ),
                          ),
                          Container(
                            child: Text(
                              'To search for your book, choose either all or free books, then choose whether you want to search by title or author by clicking on the options on the search bar.',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                              ),),textAlign: TextAlign.center
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NetworkSensitive(offlineChild: Container(), child: SearchBars()),
              ),
            ],
          ),
          if (loadGrid)
            BooksGrid(
              routeName: SearchScreen.routeName,
            ),
        ],
      ),
    );
  }
}
