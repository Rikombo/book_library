import 'package:book_library/book_info.dart';
import 'package:book_library/book_rating.dart';
import 'package:book_library/design_system/app_typography.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BLBookListItem extends StatelessWidget {
  const BLBookListItem({super.key, required this.book});

  final BookInfo book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              book.imageUrl,
              height: 84,
              width: 77,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8.5),
                child: Text(
                  book.title,
                  style: AppTypography.subtitle1Bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 17.33),
                child: Text(book.author),
              ),
              const BookRating()
            ],
          ),
        ],
      ),
    );
  }
}
