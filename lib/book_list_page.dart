import 'package:book_library/book_info.dart';
import 'package:book_library/book_info_page.dart';
import 'package:book_library/books.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/bl_book_list_item.dart';
import 'package:flutter/material.dart';
import 'package:book_library/design_system/app_colors.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

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
                  suffixIcon: const Icon(
                    Icons.mic,
                    color: AppColors.primaryOnLight,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: const BorderSide(
                        color: AppColors.onBackGroundLight, width: 0.5),
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
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _showBookDetail(context, bookInfo[index]),
                      child: BLBookListItem(
                        book: bookInfo[index],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: bookInfo.length,
                ),
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

// TODO use Spacer to make space between author and rating
