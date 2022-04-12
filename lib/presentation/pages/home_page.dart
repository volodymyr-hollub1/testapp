import 'package:flutter/material.dart';
import 'package:testapp/presentation/dto/image_page_dto.dart';
import 'package:testapp/presentation/pages/image_page.dart';
import 'package:testapp/presentation/widgets/image_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Route onGenerateRoute(RouteSettings settings) {
    late Route page;
    switch (settings.name) {
      case "/image":
        final imagePageDto = settings.arguments as ImagePageDto;
        page = MaterialPageRoute(
            builder: (context) => ImagePage(dto: imagePageDto));
        break;
    }
    return page;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      title: "TEST APP",
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
          'Test App',
          style: TextStyle(
            fontSize: 20.0,
          ),
        )),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            child: ImageList(),
          ),
        ),
      ),
    );
  }
}
