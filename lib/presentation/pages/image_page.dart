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
      body: Image.network(
        dto!.path ?? '',
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Text(
              'Not found',
              style: TextStyle(fontSize: 33, color: Colors.black87),
            ),
          );
        },
      ),
    );
  }
}
