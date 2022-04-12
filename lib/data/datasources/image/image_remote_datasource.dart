import 'package:http/http.dart' as http;
import 'package:testapp/core/fails/exception.dart';
import 'dart:convert';

import 'package:testapp/data/models/image/image_model.dart';

abstract class ImageRemoteDatasource {
  ///Get news from server by page
  Future<List<ImageModel>> getImages(int page);
}

class ImageRemoteDatasourceImpl implements ImageRemoteDatasource {
  final http.Client client;

  ImageRemoteDatasourceImpl({required this.client});

  @override
  Future<List<ImageModel>> getImages(int page) {
    return _getImagesFromUrl('/photos', page);
  }

  Future<List<ImageModel>> _getImagesFromUrl(String url, int page) async {
    final Map<String, dynamic> parameters = {
      'page': '$page',
      'client_id': Constants.clientId
    };
    final uri = Uri.https(Constants.baseUrlDomain, url, parameters);

    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return (responseBody as List)
          .map((item) => ImageModel.fromJson(item))
          .toList();
    } else {
      throw ServerException();
    }
  }
}

class Constants {
  static const String baseUrlDomain = 'api.unsplash.com';
  static const String clientId =
      'ab3411e4ac868c2646c0ed488dfd919ef612b04c264f3374c97fff98ed253dc9';
}
