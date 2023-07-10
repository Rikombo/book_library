import 'package:book_library/book_info.dart';
import 'package:book_library/design_system/app_colors.dart';
import 'package:flutter/material.dart';
import 'design_system/app_typography.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.bookInfo});

  final BookInfo bookInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.33),
      child: Row(
        children: [
          for (int i = 0; i < 5; i++)
            Icon(
              i < bookInfo.rating ? Icons.star : Icons.star_outline,
              size: 20,
              color: AppColors.primary,
            ),
          const SizedBox(
            width: 5.33,
          ),
          Text(
            '(${bookInfo.reviews})',
            style: AppTypography.caption1SemiBold.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
