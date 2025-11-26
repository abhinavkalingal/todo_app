import 'package:dartz/dartz.dart';

import '../core/failures/main_failure.dart';

typedef FutureResult<T> = Future<Either<MainFailure, T>>;
