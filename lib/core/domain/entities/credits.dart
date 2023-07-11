import 'package:equatable/equatable.dart';
import 'package:movie_hub/core/domain/entities/cast.dart';

class Credits extends Equatable {
  final List<Cast> cast;
  final String director;
  final String producer;

  const Credits({
    required this.cast,
    required this.director,
    required this.producer,
  });

  const Credits.empty()
      : cast = const [],
        director = '',
        producer = '';

  @override
  List<Object?> get props => [
        cast,
        director,
        producer,
      ];
}
