import 'package:movie_hub/core/data/network/api_constants.dart';

class UrlFormatter {
  static String getBackdropUrl(String? backdropPath) {
    if (backdropPath == null) {
      return ApiConstants.moviePlaceHolder;
    } else {
      return ApiConstants.baseBackdropUrl + backdropPath;
    }
  }

  static String getPosterUrl(String? posterPath) {
    if (posterPath == null) {
      return ApiConstants.moviePlaceHolder;
    } else {
      return ApiConstants.basePosterUrl + posterPath;
    }
  }

  static String getStillUrl(String? stillPath) {
    if (stillPath == null) {
      return ApiConstants.moviePlaceHolder;
    } else {
      return ApiConstants.baseStillUrl + stillPath;
    }
  }

  static String getProfileImageUrl(String? profilePath) {
    if (profilePath == null) {
      return ApiConstants.castPlaceHolder;
    } else {
      return ApiConstants.baseProfileUrl + profilePath;
    }
  }

  static String getAvatarUrl(String? avatarPath) {
    if (avatarPath == null) {
      return ApiConstants.avatarPlaceHolder;
    } else {
      return ApiConstants.baseAvatarUrl + avatarPath;
    }
  }

  static String getTrailerUrl(List videos) {
    if (videos.isNotEmpty) {
      String? videoKey = videos
          .where((element) => element['type'] == 'Trailer')
          .toList()
          .last['key'];
      if (videoKey != null) {
        return ApiConstants.baseVideoUrl + videoKey;
      } else {
        return '';
      }
    } else {
      return '';
    }
  }
}
