import 'package:flutter/material.dart';
import 'package:testapp/presentation/dto/image_page_dto.dart';

class ImagePage extends StatelessWidget {
  final ImagePageDto? dto;

  const ImagePage({Key? key, required this.dto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dto!.name ?? 'Photo'),
      ),
      body:
          dto!.path != null ? Image.network(dto!.path ?? '') : const SizedBox(),
    );
  }
}
