import 'package:app_book/providers/books.dart';
import 'package:app_book/screens/specific_search_screen.dart';
import 'package:app_book/services/connectivity_status.dart';
import 'package:app_book/widgets/books_grid.dart';
import 'package:app_book/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaidBookScreen extends StatefulWidget {
  static const routeName = '/Paid';

  @override
  _PaidBookScreenState createState() => _PaidBookScreenState();
}

class _PaidBookScreenState extends State<PaidBookScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var connectivity = Provider.of<ConnectivityStatus>(context);
    if (connectivity != ConnectivityStatus.Offline) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> searchArgs ={
      'type': 'paid-ebooks',
    };

    Provider.of<Books>(context, listen: false).setStartIndex();
    Provider.of<Books>(context, listen: false)
        .toggleTotalItemsCalculation(true);
    return Scaffold(
      backgroundColor: const Color(0xFF131E32),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NavBar(PaidBookScreen.routeName),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 2,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/books_title.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black87, BlendMode.overlay))),
              child: Container(
                color: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 2.0),
                            Text('Paid Ebooks',
                              softWrap: true,
                              textAlign: TextAlign.end,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: Provider.of<Books>(context, listen: false)
                .getSearchedBookByArgs(searchArgs),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                Provider.of<Books>(context, listen: false)
                    .toggleTotalItemsCalculation(false);

                return BooksGrid(routeName: SpecificSearchScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}
