import 'package:movie_hub/core/helper/url_formatter.dart';
import 'package:movie_hub/core/domain/entities/cast.dart';

class CastModel extends Cast {
  const CastModel({
    required super.name,
    required super.profilePath,
    required super.character,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'],
      profilePath: UrlFormatter.getProfileImageUrl(json['profile_path']),
      character: json['character'] ?? '',
    );
  }
}
