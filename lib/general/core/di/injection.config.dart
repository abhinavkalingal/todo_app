// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:firebase_storage/firebase_storage.dart' as _i457;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/todo/repo/todo_repository.dart' as _i792;
import 'firebase_injectable_module.dart' as _i574;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  await gh.factoryAsync<_i574.FirebaseService>(
    () => firebaseInjectableModule.firebaseService,
    preResolve: true,
  );
  gh.lazySingleton<_i457.FirebaseStorage>(
    () => firebaseInjectableModule.firebaseStorage,
  );
  gh.lazySingleton<_i974.FirebaseFirestore>(
    () => firebaseInjectableModule.firestore,
  );
  gh.lazySingleton<_i892.FirebaseMessaging>(
    () => firebaseInjectableModule.firebaseMessaging,
  );
  gh.lazySingleton<_i183.ImagePicker>(
    () => firebaseInjectableModule.imagePicker,
  );
  gh.lazySingleton<_i792.TodoRepository>(
    () => _i792.TodoRepository(gh<_i974.FirebaseFirestore>()),
  );
  return getIt;
}

class _$FirebaseInjectableModule extends _i574.FirebaseInjectableModule {}
