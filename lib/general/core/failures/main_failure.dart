import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_failure.freezed.dart';

@freezed
class MainFailure with _$MainFailure implements Exception {
  const MainFailure._();  
  
  const factory MainFailure.firebaseFailure({
    required String errMsg,
  }) = _FirebaseFailure;

  const factory MainFailure.serverFailure({
    required String errMsg,
  }) = _ServerFailure;

  const factory MainFailure.generalFailure({
    required String errMsg,
  }) = _GeneralFailure;

  const factory MainFailure.notFoundFailure({
    required String errMsg,
  }) = _NotFoundFailure;
}