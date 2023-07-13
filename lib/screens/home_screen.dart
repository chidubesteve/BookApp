import 'dart:async';
import 'package:app_book/providers/nyt.dart';
import 'package:app_book/widgets/app_title.dart';
import 'package:app_book/widgets/categoriesWidgets/categories_section.dart';
import 'package:app_book/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // Called when this State object changes.
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getBooksData();
  }

  Future<void> getBooksData() async {
    await Provider.of<NYT>(context, listen: false).getCategoryList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131E32),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NavBar(HomeScreen.routeName),
      body: RefreshIndicator(
        color: Color(0xFFFE9E3A),
        backgroundColor: Colors.white,
        displacement: 80,
        onRefresh: () async {
          await getBooksData();
        },
        child: Column(
          children: <Widget>[
            AppTitle(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:20, left: 22.0, bottom: 8.0),
                  child: Text('Categories',
                      style: GoogleFonts.montserrat(
                          textStyle:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: Colors.white))),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(child: CategoriesSection()),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:20, left: 22.0, bottom: 8.0),
                  child: Text('Free Book Sites',
                      style: GoogleFonts.montserrat(
                          textStyle:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w700, color: Colors.white))),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(child: FreesiteSection()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
