import 'package:book_library/book_info.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:flutter/material.dart';

import 'design_system/app_typography.dart';

class BookInfoPage extends StatelessWidget {
  final BookInfo book;

  const BookInfoPage({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Book Details',
                textAlign: TextAlign.center,
                style: AppTypography.headline2Bold
                    .copyWith(color: AppColors.primaryOnLight),
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  book.imageUrl,
                  height: 184,
                  width: 328,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                book.title,
                style: AppTypography.headline1Bold
                    .copyWith(color: AppColors.primaryOnLight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
