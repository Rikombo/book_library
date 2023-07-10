import 'package:book_library/books_repository.dart';

import 'package:book_library/book_info.dart';

import 'package:book_library/books.dart';

class InMemoryBooksRepository extends BooksRepository {
  final List<BookInfo> books = bookInfo;

  @override
  Future<List<BookInfo>> getBooks() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    return books;
  }

  @override
  Future<List<BookInfo>> searchBooks(String query) async {
    return books.where((book) => book.title.contains(query)).toList();
  }
}
