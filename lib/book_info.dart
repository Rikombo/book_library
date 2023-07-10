import 'package:equatable/equatable.dart';

class BookInfo extends Equatable {
  final String title;
  final String author;
  final String imageUrl;
  final String description;
  final int rating;
  final String reviews;
  final int createdAt;
  final int pages;
  final String genre;

  const BookInfo({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.reviews,
    required this.createdAt,
    required this.pages,
    required this.genre,
  });

  @override
  List<Object?> get props =>
      [
        title,
        author,
        imageUrl,
        description,
        rating,
        reviews,
        createdAt,
        pages,
        genre,
      ];
}



