import 'dart:math';
import 'package:app_book/providers/books.dart';
import 'package:app_book/screens/bookshelf_screen.dart';
import 'package:app_book/screens/freebookscreen.dart';
import 'package:app_book/screens/home_screen.dart';
import 'package:app_book/screens/paidscreen.dart';
import 'package:app_book/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  final String currentRoute;

  NavBar(this.currentRoute);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool openNav = true;

  @override
  Widget build(BuildContext context) {
    final height = min(MediaQuery.of(context).size.height * 0.2, 75.0);
    final width = min(MediaQuery.of(context).size.width * 0.9, 250.0);
    return Container(
      height: height,
      // width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            color: const Color(0xFF1E2F4D),
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                if (openNav)
                  NavbarButton('images/bookmark.png', 'Bookmark', BookShelfScreen.routeName,
                      widget.currentRoute),
                if (openNav)
                  NavbarButton(
                      'images/estate.png', 'Home', HomeScreen.routeName, widget.currentRoute),
                if (openNav)
                  NavbarButton('images/loupe.png', 'Search', SearchScreen.routeName,
                      widget.currentRoute),
                if (openNav)
                  NavbarButton('images/paid.png', 'Paid', PaidBookScreen.routeName,
                      widget.currentRoute),
                if (openNav)
                  NavbarButton('images/free.png', 'Free', FreeBookScreen.routeName,
                      widget.currentRoute),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavbarButton extends StatelessWidget {
  final String icon;
  final String label;
  final String route;
  final String currentRoute;

  NavbarButton(this.icon, this.label, this.route, this.currentRoute);

  @override
  Widget build(BuildContext context) {
    final books = Provider.of<Books>(context, listen: false);
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                width: 25,
                height: 25,
                child: Image.asset(
                  icon,
                  scale: 1.0,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  label,
                  style: GoogleFonts.montserrat(
                      textStyle:
                      const TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFFFE9E3A)),
                  ),
                ),
              ),
            ],
          ),
        ),
      onTap: () {
        if (currentRoute == route) return;
        Navigator.of(context).pushReplacementNamed(route);
        books.setFirstLoad(true);
      },
    );
  }
}
