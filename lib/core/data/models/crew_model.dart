import 'package:movie_hub/core/helper/list_formatter.dart';
import 'package:movie_hub/core/domain/entities/crew.dart';

class CrewModel extends Crew {
  const CrewModel({
    required super.director,
    required super.writer,
  });

  factory CrewModel.fromJson(Map<String, dynamic> json) {
    return CrewModel(
      director: ListFormatter.getDirectorName(json['crew']),
      writer: ListFormatter.getProducerName(json['crew']),
    );
  }
}
