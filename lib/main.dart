import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/presentation/blocs/image/image_cubit.dart';
import 'package:testapp/presentation/pages/home_page.dart';
import 'package:testapp/service_locator.dart';
import 'service_locator.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  //final currentLocale = Platform.localeName.substring(0, 2);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageCubit>(create: (context) => sl<ImageCubit>()),
      ],
      child: const StartWidget(),
    );
  }
}

class StartWidget extends StatefulWidget {
  const StartWidget({Key? key}) : super(key: key);

  @override
  State<StartWidget> createState() => _StartWidgetState();
}

class _StartWidgetState extends State<StartWidget> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
