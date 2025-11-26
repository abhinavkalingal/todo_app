// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MainFailure {
  String get errMsg => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errMsg) firebaseFailure,
    required TResult Function(String errMsg) serverFailure,
    required TResult Function(String errMsg) generalFailure,
    required TResult Function(String errMsg) notFoundFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String errMsg)? firebaseFailure,
    TResult? Function(String errMsg)? serverFailure,
    TResult? Function(String errMsg)? generalFailure,
    TResult? Function(String errMsg)? notFoundFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errMsg)? firebaseFailure,
    TResult Function(String errMsg)? serverFailure,
    TResult Function(String errMsg)? generalFailure,
    TResult Function(String errMsg)? notFoundFailure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseFailure value) firebaseFailure,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_GeneralFailure value) generalFailure,
    required TResult Function(_NotFoundFailure value) notFoundFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_GeneralFailure value)? generalFailure,
    TResult? Function(_NotFoundFailure value)? notFoundFailure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_GeneralFailure value)? generalFailure,
    TResult Function(_NotFoundFailure value)? notFoundFailure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MainFailureCopyWith<MainFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainFailureCopyWith<$Res> {
  factory $MainFailureCopyWith(
    MainFailure value,
    $Res Function(MainFailure) then,
  ) = _$MainFailureCopyWithImpl<$Res, MainFailure>;
  @useResult
  $Res call({String errMsg});
}

/// @nodoc
class _$MainFailureCopyWithImpl<$Res, $Val extends MainFailure>
    implements $MainFailureCopyWith<$Res> {
  _$MainFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errMsg = null}) {
    return _then(
      _value.copyWith(
            errMsg: null == errMsg
                ? _value.errMsg
                : errMsg // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FirebaseFailureImplCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$FirebaseFailureImplCopyWith(
    _$FirebaseFailureImpl value,
    $Res Function(_$FirebaseFailureImpl) then,
  ) = __$$FirebaseFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String errMsg});
}

/// @nodoc
class __$$FirebaseFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$FirebaseFailureImpl>
    implements _$$FirebaseFailureImplCopyWith<$Res> {
  __$$FirebaseFailureImplCopyWithImpl(
    _$FirebaseFailureImpl _value,
    $Res Function(_$FirebaseFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errMsg = null}) {
    return _then(
      _$FirebaseFailureImpl(
        errMsg: null == errMsg
            ? _value.errMsg
            : errMsg // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$FirebaseFailureImpl extends _FirebaseFailure {
  const _$FirebaseFailureImpl({required this.errMsg}) : super._();

  @override
  final String errMsg;

  @override
  String toString() {
    return 'MainFailure.firebaseFailure(errMsg: $errMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirebaseFailureImpl &&
            (identical(other.errMsg, errMsg) || other.errMsg == errMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errMsg);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirebaseFailureImplCopyWith<_$FirebaseFailureImpl> get copyWith =>
      __$$FirebaseFailureImplCopyWithImpl<_$FirebaseFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errMsg) firebaseFailure,
    required TResult Function(String errMsg) serverFailure,
    required TResult Function(String errMsg) generalFailure,
    required TResult Function(String errMsg) notFoundFailure,
  }) {
    return firebaseFailure(errMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String errMsg)? firebaseFailure,
    TResult? Function(String errMsg)? serverFailure,
    TResult? Function(String errMsg)? generalFailure,
    TResult? Function(String errMsg)? notFoundFailure,
  }) {
    return firebaseFailure?.call(errMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errMsg)? firebaseFailure,
    TResult Function(String errMsg)? serverFailure,
    TResult Function(String errMsg)? generalFailure,
    TResult Function(String errMsg)? notFoundFailure,
    required TResult orElse(),
  }) {
    if (firebaseFailure != null) {
      return firebaseFailure(errMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseFailure value) firebaseFailure,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_GeneralFailure value) generalFailure,
    required TResult Function(_NotFoundFailure value) notFoundFailure,
  }) {
    return firebaseFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_GeneralFailure value)? generalFailure,
    TResult? Function(_NotFoundFailure value)? notFoundFailure,
  }) {
    return firebaseFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_GeneralFailure value)? generalFailure,
    TResult Function(_NotFoundFailure value)? notFoundFailure,
    required TResult orElse(),
  }) {
    if (firebaseFailure != null) {
      return firebaseFailure(this);
    }
    return orElse();
  }
}

abstract class _FirebaseFailure extends MainFailure {
  const factory _FirebaseFailure({required final String errMsg}) =
      _$FirebaseFailureImpl;
  const _FirebaseFailure._() : super._();

  @override
  String get errMsg;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirebaseFailureImplCopyWith<_$FirebaseFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
    _$ServerFailureImpl value,
    $Res Function(_$ServerFailureImpl) then,
  ) = __$$ServerFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String errMsg});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
    _$ServerFailureImpl _value,
    $Res Function(_$ServerFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errMsg = null}) {
    return _then(
      _$ServerFailureImpl(
        errMsg: null == errMsg
            ? _value.errMsg
            : errMsg // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ServerFailureImpl extends _ServerFailure {
  const _$ServerFailureImpl({required this.errMsg}) : super._();

  @override
  final String errMsg;

  @override
  String toString() {
    return 'MainFailure.serverFailure(errMsg: $errMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            (identical(other.errMsg, errMsg) || other.errMsg == errMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errMsg);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errMsg) firebaseFailure,
    required TResult Function(String errMsg) serverFailure,
    required TResult Function(String errMsg) generalFailure,
    required TResult Function(String errMsg) notFoundFailure,
  }) {
    return serverFailure(errMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String errMsg)? firebaseFailure,
    TResult? Function(String errMsg)? serverFailure,
    TResult? Function(String errMsg)? generalFailure,
    TResult? Function(String errMsg)? notFoundFailure,
  }) {
    return serverFailure?.call(errMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errMsg)? firebaseFailure,
    TResult Function(String errMsg)? serverFailure,
    TResult Function(String errMsg)? generalFailure,
    TResult Function(String errMsg)? notFoundFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(errMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseFailure value) firebaseFailure,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_GeneralFailure value) generalFailure,
    required TResult Function(_NotFoundFailure value) notFoundFailure,
  }) {
    return serverFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_GeneralFailure value)? generalFailure,
    TResult? Function(_NotFoundFailure value)? notFoundFailure,
  }) {
    return serverFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_GeneralFailure value)? generalFailure,
    TResult Function(_NotFoundFailure value)? notFoundFailure,
    required TResult orElse(),
  }) {
    if (serverFailure != null) {
      return serverFailure(this);
    }
    return orElse();
  }
}

abstract class _ServerFailure extends MainFailure {
  const factory _ServerFailure({required final String errMsg}) =
      _$ServerFailureImpl;
  const _ServerFailure._() : super._();

  @override
  String get errMsg;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GeneralFailureImplCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$GeneralFailureImplCopyWith(
    _$GeneralFailureImpl value,
    $Res Function(_$GeneralFailureImpl) then,
  ) = __$$GeneralFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String errMsg});
}

/// @nodoc
class __$$GeneralFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$GeneralFailureImpl>
    implements _$$GeneralFailureImplCopyWith<$Res> {
  __$$GeneralFailureImplCopyWithImpl(
    _$GeneralFailureImpl _value,
    $Res Function(_$GeneralFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errMsg = null}) {
    return _then(
      _$GeneralFailureImpl(
        errMsg: null == errMsg
            ? _value.errMsg
            : errMsg // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GeneralFailureImpl extends _GeneralFailure {
  const _$GeneralFailureImpl({required this.errMsg}) : super._();

  @override
  final String errMsg;

  @override
  String toString() {
    return 'MainFailure.generalFailure(errMsg: $errMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeneralFailureImpl &&
            (identical(other.errMsg, errMsg) || other.errMsg == errMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errMsg);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeneralFailureImplCopyWith<_$GeneralFailureImpl> get copyWith =>
      __$$GeneralFailureImplCopyWithImpl<_$GeneralFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errMsg) firebaseFailure,
    required TResult Function(String errMsg) serverFailure,
    required TResult Function(String errMsg) generalFailure,
    required TResult Function(String errMsg) notFoundFailure,
  }) {
    return generalFailure(errMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String errMsg)? firebaseFailure,
    TResult? Function(String errMsg)? serverFailure,
    TResult? Function(String errMsg)? generalFailure,
    TResult? Function(String errMsg)? notFoundFailure,
  }) {
    return generalFailure?.call(errMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errMsg)? firebaseFailure,
    TResult Function(String errMsg)? serverFailure,
    TResult Function(String errMsg)? generalFailure,
    TResult Function(String errMsg)? notFoundFailure,
    required TResult orElse(),
  }) {
    if (generalFailure != null) {
      return generalFailure(errMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseFailure value) firebaseFailure,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_GeneralFailure value) generalFailure,
    required TResult Function(_NotFoundFailure value) notFoundFailure,
  }) {
    return generalFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_GeneralFailure value)? generalFailure,
    TResult? Function(_NotFoundFailure value)? notFoundFailure,
  }) {
    return generalFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_GeneralFailure value)? generalFailure,
    TResult Function(_NotFoundFailure value)? notFoundFailure,
    required TResult orElse(),
  }) {
    if (generalFailure != null) {
      return generalFailure(this);
    }
    return orElse();
  }
}

abstract class _GeneralFailure extends MainFailure {
  const factory _GeneralFailure({required final String errMsg}) =
      _$GeneralFailureImpl;
  const _GeneralFailure._() : super._();

  @override
  String get errMsg;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeneralFailureImplCopyWith<_$GeneralFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundFailureImplCopyWith<$Res>
    implements $MainFailureCopyWith<$Res> {
  factory _$$NotFoundFailureImplCopyWith(
    _$NotFoundFailureImpl value,
    $Res Function(_$NotFoundFailureImpl) then,
  ) = __$$NotFoundFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String errMsg});
}

/// @nodoc
class __$$NotFoundFailureImplCopyWithImpl<$Res>
    extends _$MainFailureCopyWithImpl<$Res, _$NotFoundFailureImpl>
    implements _$$NotFoundFailureImplCopyWith<$Res> {
  __$$NotFoundFailureImplCopyWithImpl(
    _$NotFoundFailureImpl _value,
    $Res Function(_$NotFoundFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? errMsg = null}) {
    return _then(
      _$NotFoundFailureImpl(
        errMsg: null == errMsg
            ? _value.errMsg
            : errMsg // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NotFoundFailureImpl extends _NotFoundFailure {
  const _$NotFoundFailureImpl({required this.errMsg}) : super._();

  @override
  final String errMsg;

  @override
  String toString() {
    return 'MainFailure.notFoundFailure(errMsg: $errMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundFailureImpl &&
            (identical(other.errMsg, errMsg) || other.errMsg == errMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errMsg);

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      __$$NotFoundFailureImplCopyWithImpl<_$NotFoundFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String errMsg) firebaseFailure,
    required TResult Function(String errMsg) serverFailure,
    required TResult Function(String errMsg) generalFailure,
    required TResult Function(String errMsg) notFoundFailure,
  }) {
    return notFoundFailure(errMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String errMsg)? firebaseFailure,
    TResult? Function(String errMsg)? serverFailure,
    TResult? Function(String errMsg)? generalFailure,
    TResult? Function(String errMsg)? notFoundFailure,
  }) {
    return notFoundFailure?.call(errMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String errMsg)? firebaseFailure,
    TResult Function(String errMsg)? serverFailure,
    TResult Function(String errMsg)? generalFailure,
    TResult Function(String errMsg)? notFoundFailure,
    required TResult orElse(),
  }) {
    if (notFoundFailure != null) {
      return notFoundFailure(errMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FirebaseFailure value) firebaseFailure,
    required TResult Function(_ServerFailure value) serverFailure,
    required TResult Function(_GeneralFailure value) generalFailure,
    required TResult Function(_NotFoundFailure value) notFoundFailure,
  }) {
    return notFoundFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FirebaseFailure value)? firebaseFailure,
    TResult? Function(_ServerFailure value)? serverFailure,
    TResult? Function(_GeneralFailure value)? generalFailure,
    TResult? Function(_NotFoundFailure value)? notFoundFailure,
  }) {
    return notFoundFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FirebaseFailure value)? firebaseFailure,
    TResult Function(_ServerFailure value)? serverFailure,
    TResult Function(_GeneralFailure value)? generalFailure,
    TResult Function(_NotFoundFailure value)? notFoundFailure,
    required TResult orElse(),
  }) {
    if (notFoundFailure != null) {
      return notFoundFailure(this);
    }
    return orElse();
  }
}

abstract class _NotFoundFailure extends MainFailure {
  const factory _NotFoundFailure({required final String errMsg}) =
      _$NotFoundFailureImpl;
  const _NotFoundFailure._() : super._();

  @override
  String get errMsg;

  /// Create a copy of MainFailure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundFailureImplCopyWith<_$NotFoundFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
