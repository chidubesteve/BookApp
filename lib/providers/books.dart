import 'dart:convert';
import 'package:app_book/models/book.dart';
import 'package:app_book/services/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum PaginatorCall {
  byTitle,
  byArgs,
}

class Books extends ChangeNotifier {
  List<Book> _searchedBooksList = [];
  final _singleLoadBookCount = 18;
  int startIndex = 0;
  String _searchedString = '';
  Map _searchedArgs = {};
  late int totalItems;
  bool _isLoading = false;
  bool _reachedEnd = false;
  bool _firstLoad = true;
  late bool _byTitleNotAuthor;
  late bool _free;
  late PaginatorCall calledBy;
  void setLoading(bool loadingState) {
    _isLoading = loadingState;
    notifyListeners();
  }

  bool get firstLoad {
    return _firstLoad;
  }

  void toggleTotalItemsCalculation(bool toggle) {
    _firstLoad = toggle;
  }

  List<Book> get getBooksList {
    return [..._searchedBooksList];
  }

  bool get isLoading {
    return _isLoading;
  }

  int get totalBookCount {
    return totalItems;
  }

  void setStartIndex() {
    startIndex = 0;
  }

  bool get reachedEnd {
    return _reachedEnd;
  }

  void setFirstLoad(bool value) {
    _firstLoad = value;
    notifyListeners();
  }

  bool _specificScreenLoadingState = false;
  void setSpecificScreenLoadingState(bool value) {
    _specificScreenLoadingState = value;
    notifyListeners();
  }

  bool get specificScreenLoadingState => _specificScreenLoadingState;

  ///uses google API to gets book by title, author or all for search screen
  Future<void> getSearchedBookData(
      String searchString, bool byTitleNotAuthor, bool free) async {
    calledBy = PaginatorCall.byTitle;
    _byTitleNotAuthor = byTitleNotAuthor;
    _free = free;
    _searchedBooksList.clear();
    _searchedString = searchString;
    var url = !_free
        ? 'https://www.googleapis.com/books/v1/volumes?q=${byTitleNotAuthor ? 'intitle' : 'inauthor'}:$searchString&maxResults=$_singleLoadBookCount&startIndex=$startIndex'
        : 'https://www.googleapis.com/books/v1/volumes?q=${byTitleNotAuthor ? 'intitle' : 'inauthor'}:$searchString&filter=free-ebooks&maxResults=$_singleLoadBookCount&startIndex=$startIndex';

    try {
      _reachedEnd = false;
      setLoading(true);
      http.Response response = await http.get(Uri.parse(url));

      setLoading(false);
      var jsonResponse = await jsonDecode(response.body);
      if (response != null) {
        if (_firstLoad) {
          totalItems = jsonResponse['totalItems'];
          setFirstLoad(false);
        }

        List searchedBooksJson = jsonResponse['items'];

        if (searchedBooksJson == null) {
          _reachedEnd = true;
          return;
        }
        List<Book> searchedBooks = [];
        searchedBooksJson.forEach((book) {
          searchedBooks.add(Utils.bookFromJson(book));
        });

        _searchedBooksList = searchedBooks;

      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }


  ///uses google API to gets book by title, category, free or paid
  Future<void> getSearchedBookByArgs(Map searchArgs) async {
    calledBy = PaginatorCall.byArgs;
    _searchedArgs = searchArgs;
    _searchedBooksList.clear();
    var url;
    if (searchArgs.containsKey('bookTitle') &&
        searchArgs.containsKey('bookAuthor')) {
      url =
          'https://www.googleapis.com/books/v1/volumes?q=intitle:${searchArgs['bookTitle']}+inauthor:${searchArgs['bookAuthor']}&orderBy=newest&maxResults=$_singleLoadBookCount&startIndex=$startIndex';
    }
    if (searchArgs.containsKey('category')) {
      url =
          'https://www.googleapis.com/books/v1/volumes?q=subject:${searchArgs['category']}&orderBy=newest&maxResults=$_singleLoadBookCount&startIndex=$startIndex';
    }
    if (searchArgs.containsKey('type')) {
      url =
      'https://www.googleapis.com/books/v1/volumes?q=all&filter=${searchArgs['type']}&maxResults=$_singleLoadBookCount&startIndex=$startIndex';
    }
    try {
      _reachedEnd = false;
      http.Response response = await http.get(Uri.parse(url));

      var jsonResponse = await jsonDecode(response.body);


      if (response != null) {
        setSpecificScreenLoadingState(false);
        if (_firstLoad) totalItems = jsonResponse['totalItems'];

        List searchedBooksJson = jsonResponse['items'];

        if (searchedBooksJson == null) {
          _reachedEnd = true;
          return;
        }
        List<Book> searchedBooks = [];

        searchedBooksJson.forEach((book) {
          searchedBooks.add(Utils.bookFromJson(book));
        });
        print(searchedBooks);
        _searchedBooksList = searchedBooks;
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  ///uses google API to gets book by free or paid
  Future<void> getSearchedFPBookByArgs(String searchArgs) async {
    calledBy = PaginatorCall.byArgs;
    _searchedString = searchArgs;
    _searchedBooksList.clear();
    var url;
    if (_searchedString == 'free-ebooks') {
      url =
      'https://www.googleapis.com/books/v1/volumes?q=all&filter=free-ebooks&maxResults=$_singleLoadBookCount&startIndex=$startIndex';
    }
    if (_searchedString == 'paid-ebooks') {
      url =
      'https://www.googleapis.com/books/v1/volumes?q=all&filter=free-ebooks&maxResults=$_singleLoadBookCount&startIndex=$startIndex';
    }
    try {
      _reachedEnd = false;
      http.Response response = await http.get(Uri.parse(url));

      var jsonResponse = await jsonDecode(response.body);


      if (response != null) {
        setSpecificScreenLoadingState(false);
        if (_firstLoad) totalItems = jsonResponse['totalItems'];

        List searchedBooksJson = jsonResponse['items'];

        if (searchedBooksJson == null) {
          _reachedEnd = true;
          return;
        }
        List<Book> searchedBooks = [];

        searchedBooksJson.forEach((book) {
          searchedBooks.add(Utils.bookFromJson(book));
        });
        print(searchedBooks);
        _searchedBooksList = searchedBooks;
      }
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void paginate(bool foreword) {
    foreword
        ? startIndex += _singleLoadBookCount
        : startIndex >= _singleLoadBookCount
            ? startIndex -= _singleLoadBookCount
            : startIndex = _singleLoadBookCount;
    calledBy == PaginatorCall.byTitle
        ? getSearchedBookData(_searchedString, _byTitleNotAuthor, _free)
        : getSearchedBookByArgs(_searchedArgs);
  }

  Book getBookById(String id) {
    return _searchedBooksList.firstWhere((element) => (element.id == id));
  }

  // void paginated(bool foreword) {
  //   foreword
  //       ? startIndex += _singleLoadBookCount
  //       : startIndex >= _singleLoadBookCount
  //       ? startIndex -= _singleLoadBookCount
  //       : startIndex = _singleLoadBookCount;
  //   calledBy == PaginatorCall.byTitle
  //       ? getSearchedBookData(_searchedString, _byTitleNotAuthor, _free)
  //       : getSearchedFPBookByArgs(_searchedString);
  // }

  void clearList() {
    _searchedBooksList.clear();
    notifyListeners();
  }
}
