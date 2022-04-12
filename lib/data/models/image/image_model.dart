import 'package:testapp/domain/entities/image/image_entity.dart';

class ImageModel extends ImageEntity {
  const ImageModel(
      {required id, required description, required user, required path})
      : super(id: id, description: description, user: user, path: path);

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
        id: json['id'],
        description: json['description'],
        user: User(name: json['user']['name']),
        path: json['urls']['raw']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'description': description, 'user': user};
  }
}
