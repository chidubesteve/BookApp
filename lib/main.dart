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
  //Entry point of a flutter application
  runApp(BooksApp());
}

class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //forces the application to remain portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
//providers to manage the state of the listed below
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
        //this screen is displayed first once the applications loads completely
        initialRoute: SplashScreen.routeName,
        //using of named route for navigating between screens
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
