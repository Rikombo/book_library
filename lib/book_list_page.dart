import 'package:book_library/design_system/app_typography.dart';
import 'package:book_library/design_system/bl_book_list_item.dart';
import 'package:flutter/material.dart';

import 'design_system/app_colors.dart';

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
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Search for books...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.mic),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 1))),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Book Search',
                style: AppTypography.headline1Bold
                    .copyWith(color: AppColors.primaryOnLight),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => const BLBookListItem(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO use Spacer to make space between author and rating
