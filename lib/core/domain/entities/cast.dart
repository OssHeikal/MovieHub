import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final String name;
  final String profilePath;
  final String character;

  const Cast({
    required this.name,
    required this.profilePath,
    required this.character,
  });

  @override
  List<Object?> get props => [
        name,
        profilePath,
        character,
      ];
}

