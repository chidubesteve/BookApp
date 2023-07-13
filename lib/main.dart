// import 'package:flutter/material.dart';
// import 'package:app_book/screens/splashscreen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SplashScreen(),
//     );
//   }
// }

import 'package:app_book/providers/books.dart';
import 'package:app_book/providers/bookshelf.dart';
import 'package:app_book/providers/categories.dart';
import 'package:app_book/providers/nyt.dart';
import 'package:app_book/screens/bookshelf_screen.dart';
import 'package:app_book/screens/freebookscreen.dart';
import 'package:app_book/screens/home_screen.dart';
import 'package:app_book/screens/onboarding.dart';
import 'package:app_book/screens/paidscreen.dart';
import 'package:app_book/screens/search_screen.dart';
import 'package:app_book/screens/specific_search_screen.dart';
import 'package:app_book/screens/splashscreen.dart';
import 'package:app_book/services/connectivity_service.dart';
import 'package:app_book/services/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Books(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => NYT(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Bookshelf(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Categories(),
        ),
        StreamProvider<ConnectivityStatus?>(
          create: (BuildContext context) =>
          ConnectivityService().connectionStatusController.stream, initialData: ConnectivityStatus.Cellular,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: {
          SearchScreen.routeName: (context) => SearchScreen(),
          BookShelfScreen.routeName: (context) => BookShelfScreen(),
          SpecificSearchScreen.routeName: (context) => SpecificSearchScreen(),
          PaidBookScreen.routeName: (context) => PaidBookScreen(),
          FreeBookScreen.routeName: (context) => FreeBookScreen(),
          onBoardingScreen.routeName: (context) => onBoardingScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          SplashScreen.routeName: (context) => SplashScreen(),
        },
      ),
    );
  }
}
