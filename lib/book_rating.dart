import 'package:book_library/design_system/app_colors.dart';
import 'package:flutter/material.dart';

import 'design_system/app_typography.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.33),
      child: Row(
        children: [
          const Icon(
            Icons.star_outline,
            size: 20,
            color: AppColors.primary,
          ),
          const Icon(
            Icons.star_outline,
            size: 20,
            color: AppColors.primary,
          ),
          const Icon(
            Icons.star_outline,
            size: 20,
            color: AppColors.primary,
          ),
          const Icon(
            Icons.star_outline,
            size: 20,
            color: AppColors.primary,
          ),
          const Icon(
            Icons.star_outline,
            size: 20,
            color: AppColors.primary,
          ),
          const SizedBox(
            width: 5.33,
          ),
          Text(
            '(49)',
            style: AppTypography.caption1SemiBold.copyWith(
              color: AppColors.primary,
            ),
          )
        ],
      ),
    );
  }
}
