import 'package:app_book/models/savedBook.dart';
import 'package:app_book/services/db_helper.dart';
import 'package:flutter/cupertino.dart';

class Bookshelf with ChangeNotifier {
  List<SavedBook> _savedBooks = [];

  List<SavedBook> get savedBooks {
    return [..._savedBooks];
  }

  //this function adds the book to the local db which in this case we used sqlflite 
  void addToBookShelf(
      String bookId, String bookTitle, String bookImageUrl, String authors) {
    final bookToSave = SavedBook(
        id: bookId, title: bookTitle, imageUrl: bookImageUrl, authors: authors);
    _savedBooks.add(bookToSave);
    notifyListeners();

    DBHelper.insert('bookshelf', {
      'bookId': bookToSave.id,
      'bookTitle': bookToSave.title,
      'authors': bookToSave.authors,
      'bookImageUrl': bookToSave.imageUrl,
    });
  }

  //this function fetches data from the local db and uses the book id to run a get on the google API to retrieve the book details 
  Future<void> fetchAndSetBooks() async {
    await DBHelper.database();
    final savedBooksList = await DBHelper.getData('bookshelf');
    _savedBooks = savedBooksList
        .map((item) => SavedBook(
            id: item['bookId'],
            title: item['bookTitle'],
            authors: item['authors'],
            imageUrl: item['bookImageUrl']))
        .toList();
  }

  //this function deletes book info from local db
  Future<void> removeSavedBook(String id) async {
    await DBHelper.deleteBook(id);
    fetchAndSetBooks();
  }

  Future<bool> checkExistingBook(String id) async {
    return await DBHelper.findBook(id);
  }
}
