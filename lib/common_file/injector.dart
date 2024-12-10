import 'package:get_it/get_it.dart';
import 'package:joke_app/common_file/api_calls.dart';

class Injector {
  Injector._();
  static init() {
    GetIt.instance.registerLazySingleton<ApiCalls>(
      () => ApiCalls(),
    );
  }
}
