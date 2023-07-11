import 'package:movie_hub/core/helper/list_formatter.dart';
import 'package:movie_hub/core/domain/entities/credits.dart';

class CreditsModel extends Credits {
  const CreditsModel({
    required super.cast,
    required super.director,
    required super.producer,
  });

  factory CreditsModel.fromJson(Map<String, dynamic> json) {
    return CreditsModel(
      cast: ListFormatter.getCastList(json['cast']),
      director: ListFormatter.getDirectorName(json['crew']),
      producer: ListFormatter.getProducerName(json['crew']),
    );
  }
}
