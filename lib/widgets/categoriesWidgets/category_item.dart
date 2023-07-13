import 'package:app_book/models/category.dart';
import 'package:app_book/screens/specific_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatefulWidget {
  final Category category;

  CategoryItem(this.category);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  double elevation = 18.0;

  void navigateToSpecificSearchScreen() {
    setState(() {
      elevation = 4.0;
    });

    Future.delayed(const Duration(milliseconds: 100)).then((_) {
      setState(() {
        elevation = 18.0;
      });
      Navigator.of(context)
          .pushNamed(SpecificSearchScreen.routeName, arguments: {
        'category': widget.category.categoryLink,
        'categoryTitle': widget.category.categoryTitle,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2F4D),
        borderRadius: BorderRadius.circular(13),
        boxShadow:const [
           BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 20,
            spreadRadius: -10,
            color: Color(0xFF131E32),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: navigateToSpecificSearchScreen,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                child: Image.asset(
                  widget.category.iconLink,
                  scale: 1.0,
                ),
              ),
              const SizedBox(height: 10),
              FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  widget.category.categoryTitle,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    // letterSpacing: 2,
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FreeItem extends StatefulWidget {
  final siteCategories freesites;

  FreeItem(this.freesites);

  @override
  _FreeItemState createState() => _FreeItemState();
}

class _FreeItemState extends State<FreeItem> {
  double elevation = 18.0;

  void navigateToSpecificSearchScreen() {
    setState(() {
      elevation = 4.0;
    });

    // Future.delayed(const Duration(milliseconds: 100)).then((_) {
    //   setState(() {
    //     elevation = 18.0;
    //   });
    //   Navigator.of(context)
    //       .pushNamed(SpecificSearchScreen.routeName, arguments: {
    //     'category': widget.freesites.categoryLink,
    //     'categoryTitle': widget.freesites.categoryTitle,
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2F4D),
        borderRadius: BorderRadius.circular(13),
        boxShadow:const [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 20,
            spreadRadius: -10,
            color: Color(0xFF131E32),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: navigateToSpecificSearchScreen,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                child: Image.network(
                  widget.freesites.logoUrl,
                  scale: 1.0,
                ),
              ),
              const SizedBox(height: 10),
              FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  widget.freesites.name,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        // letterSpacing: 2,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
