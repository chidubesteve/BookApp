import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      image: const DecorationImage(
          image: AssetImage("images/books_title.jpg"), fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(Colors.black87, BlendMode.overlay)

      )),
        child: Padding(
    padding: const EdgeInsets.all(22.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              'Hello, Friend!',
              textAlign: TextAlign.start,
              style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 0.9,
                      fontSize: 26)),
            ),
          ),
        ),
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Which book suits your',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          height: 0.9,
                          fontSize: 15)),
                ),
              ),
              Text(
                'current mood?',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        height: 0.9,
                        fontSize: 15)),
              ),
            ],
          ),
        ),
      ],
    ),
        ),
      );
  }
}
