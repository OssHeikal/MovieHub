import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final double rating;
  final String content;
  final String authorName;
  final String createdAt;
  final String autherAvatar;
  final String autherUsername;

  const Review({
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.authorName,
    required this.autherAvatar,
    required this.autherUsername,
  });

  @override
  List<Object?> get props => [
        rating,
        content,
        createdAt,
        authorName,
        autherAvatar,
        autherUsername,
      ];
}
