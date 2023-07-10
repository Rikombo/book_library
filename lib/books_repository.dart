import 'package:book_library/book_info.dart';

abstract class BooksRepository {
  Future<List<BookInfo>> getBooks();

  Future<List<BookInfo>> searchBooks(String query);
}
