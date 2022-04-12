import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String? id;
  final String? description;
  final String? path;
  final User? user;

  const ImageEntity(
      {required this.id,
      required this.description,
      required this.user,
      required this.path});

  @override
  List<Object?> get props => [id, description, user];
}

class User extends Equatable {
  final String? name;

  const User({required this.name});

  @override
  List<Object?> get props => [name];
}
