import 'dart:async';
import 'package:book_library/book_info.dart';
import 'package:book_library/book_info_page.dart';
import 'package:book_library/books_repository.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/bl_book_list_item.dart';
import 'package:flutter/material.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  late final BooksRepository booksRepository;
  Future<List<BookInfo>>? booksFuture;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debouncer;

  void _debounceSearch() {
    if (_debouncer != null) {
      _debouncer?.cancel();
    }
    _debouncer = Timer(const Duration(seconds: 3), () {
      final query = _searchController.text;
      setState(() {
        booksFuture = booksRepository.searchBooks(query);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    booksRepository = RepositoryProvider.of<BooksRepository>(context);
    booksFuture = booksRepository.getBooks();
    _searchController.addListener(_debounceSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debouncer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search for books...',
                  hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      height: 1.2,
                      fontFamily: 'KohSantepheap',
                      color: AppColors.primaryOnLight),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.primaryOnLight,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                      color: AppColors.onBackGroundLight,
                      width: 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Book Search',
                style: AppTypography.headline1Bold
                    .copyWith(color: AppColors.primaryOnLight),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: FutureBuilder<List<BookInfo>>(
                    future: booksFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('An error occurred: ${snapshot.error}'),
                        );
                      } else {
                        final books = snapshot.data ?? [];
                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () =>
                                  _showBookDetail(context, books[index]),
                              child: BLBookListItem(
                                book: books[index],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                          itemCount: books.length,
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBookDetail(BuildContext context, BookInfo book) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => BookInfoPage(book: book),
    ));
  }
}
