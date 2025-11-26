import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:to_do/general/core/di/injection.config.dart';

final GetIt sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  await init(sl, environment: Environment.prod);
}
