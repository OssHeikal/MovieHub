import 'package:movie_hub/core/helper/date_time_formatter.dart';
import 'package:movie_hub/core/helper/url_formatter.dart';
import 'package:movie_hub/core/domain/entities/review.dart';

class ReviewModel extends Review {
  const ReviewModel({
    required super.authorName,
    required super.content,
    required super.createdAt,
    required super.rating,
    required super.autherAvatar,
    required super.autherUsername,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      authorName: json['author_details']['name'],
      content: json['content'],
      createdAt: DateTimeFormatter.formateDuration(json['created_at']),
      rating: json['author_details']['rating'] ?? -1.0,
      autherAvatar:
          UrlFormatter.getAvatarUrl(json['author_details']['avatar_path']),
      autherUsername: json['author_details']['username'],
    );
  }
}
