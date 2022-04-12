import 'package:testapp/core/fails/failure.dart';

class MapFailure {
  ///return text Errors what depend to runtimeType
  String getFailure(failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server problem';
      default:
        return 'Unexpected Error';
    }
  }
}
