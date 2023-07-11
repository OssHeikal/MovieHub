import 'package:equatable/equatable.dart';

class Crew extends Equatable {
  final String director;
  final String writer;

  const Crew({
    required this.director,
    required this.writer,
  });

  @override
  List<Object?> get props => [
        director,
        writer,
      ];
}
