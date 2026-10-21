// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() representativesLoading,
    required TResult Function() representativesSuccess,
    required TResult Function(String message) representativesError,
    required TResult Function(bool status) updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? representativesLoading,
    TResult? Function()? representativesSuccess,
    TResult? Function(String message)? representativesError,
    TResult? Function(bool status)? updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? representativesLoading,
    TResult Function()? representativesSuccess,
    TResult Function(String message)? representativesError,
    TResult Function(bool status)? updateStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RepresentativesLoading<T> value)
        representativesLoading,
    required TResult Function(RepresentativesSuccess<T> value)
        representativesSuccess,
    required TResult Function(RepresentativesError<T> value)
        representativesError,
    required TResult Function(UpdateStatus<T> value) updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RepresentativesLoading<T> value)? representativesLoading,
    TResult? Function(RepresentativesSuccess<T> value)? representativesSuccess,
    TResult? Function(RepresentativesError<T> value)? representativesError,
    TResult? Function(UpdateStatus<T> value)? updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RepresentativesLoading<T> value)? representativesLoading,
    TResult Function(RepresentativesSuccess<T> value)? representativesSuccess,
    TResult Function(RepresentativesError<T> value)? representativesError,
    TResult Function(UpdateStatus<T> value)? updateStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<T, $Res> {
  factory $HomeStateCopyWith(
          HomeState<T> value, $Res Function(HomeState<T>) then) =
      _$HomeStateCopyWithImpl<T, $Res, HomeState<T>>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<T, $Res, $Val extends HomeState<T>>
    implements $HomeStateCopyWith<T, $Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HomeState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() representativesLoading,
    required TResult Function() representativesSuccess,
    required TResult Function(String message) representativesError,
    required TResult Function(bool status) updateStatus,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? representativesLoading,
    TResult? Function()? representativesSuccess,
    TResult? Function(String message)? representativesError,
    TResult? Function(bool status)? updateStatus,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? representativesLoading,
    TResult Function()? representativesSuccess,
    TResult Function(String message)? representativesError,
    TResult Function(bool status)? updateStatus,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RepresentativesLoading<T> value)
        representativesLoading,
    required TResult Function(RepresentativesSuccess<T> value)
        representativesSuccess,
    required TResult Function(RepresentativesError<T> value)
        representativesError,
    required TResult Function(UpdateStatus<T> value) updateStatus,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RepresentativesLoading<T> value)? representativesLoading,
    TResult? Function(RepresentativesSuccess<T> value)? representativesSuccess,
    TResult? Function(RepresentativesError<T> value)? representativesError,
    TResult? Function(UpdateStatus<T> value)? updateStatus,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RepresentativesLoading<T> value)? representativesLoading,
    TResult Function(RepresentativesSuccess<T> value)? representativesSuccess,
    TResult Function(RepresentativesError<T> value)? representativesError,
    TResult Function(UpdateStatus<T> value)? updateStatus,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements HomeState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$RepresentativesLoadingImplCopyWith<T, $Res> {
  factory _$$RepresentativesLoadingImplCopyWith(
          _$RepresentativesLoadingImpl<T> value,
          $Res Function(_$RepresentativesLoadingImpl<T>) then) =
      __$$RepresentativesLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$RepresentativesLoadingImplCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$RepresentativesLoadingImpl<T>>
    implements _$$RepresentativesLoadingImplCopyWith<T, $Res> {
  __$$RepresentativesLoadingImplCopyWithImpl(
      _$RepresentativesLoadingImpl<T> _value,
      $Res Function(_$RepresentativesLoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RepresentativesLoadingImpl<T> implements RepresentativesLoading<T> {
  const _$RepresentativesLoadingImpl();

  @override
  String toString() {
    return 'HomeState<$T>.representativesLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepresentativesLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() representativesLoading,
    required TResult Function() representativesSuccess,
    required TResult Function(String message) representativesError,
    required TResult Function(bool status) updateStatus,
  }) {
    return representativesLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? representativesLoading,
    TResult? Function()? representativesSuccess,
    TResult? Function(String message)? representativesError,
    TResult? Function(bool status)? updateStatus,
  }) {
    return representativesLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? representativesLoading,
    TResult Function()? representativesSuccess,
    TResult Function(String message)? representativesError,
    TResult Function(bool status)? updateStatus,
    required TResult orElse(),
  }) {
    if (representativesLoading != null) {
      return representativesLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RepresentativesLoading<T> value)
        representativesLoading,
    required TResult Function(RepresentativesSuccess<T> value)
        representativesSuccess,
    required TResult Function(RepresentativesError<T> value)
        representativesError,
    required TResult Function(UpdateStatus<T> value) updateStatus,
  }) {
    return representativesLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RepresentativesLoading<T> value)? representativesLoading,
    TResult? Function(RepresentativesSuccess<T> value)? representativesSuccess,
    TResult? Function(RepresentativesError<T> value)? representativesError,
    TResult? Function(UpdateStatus<T> value)? updateStatus,
  }) {
    return representativesLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RepresentativesLoading<T> value)? representativesLoading,
    TResult Function(RepresentativesSuccess<T> value)? representativesSuccess,
    TResult Function(RepresentativesError<T> value)? representativesError,
    TResult Function(UpdateStatus<T> value)? updateStatus,
    required TResult orElse(),
  }) {
    if (representativesLoading != null) {
      return representativesLoading(this);
    }
    return orElse();
  }
}

abstract class RepresentativesLoading<T> implements HomeState<T> {
  const factory RepresentativesLoading() = _$RepresentativesLoadingImpl<T>;
}

/// @nodoc
abstract class _$$RepresentativesSuccessImplCopyWith<T, $Res> {
  factory _$$RepresentativesSuccessImplCopyWith(
          _$RepresentativesSuccessImpl<T> value,
          $Res Function(_$RepresentativesSuccessImpl<T>) then) =
      __$$RepresentativesSuccessImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$RepresentativesSuccessImplCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$RepresentativesSuccessImpl<T>>
    implements _$$RepresentativesSuccessImplCopyWith<T, $Res> {
  __$$RepresentativesSuccessImplCopyWithImpl(
      _$RepresentativesSuccessImpl<T> _value,
      $Res Function(_$RepresentativesSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RepresentativesSuccessImpl<T> implements RepresentativesSuccess<T> {
  const _$RepresentativesSuccessImpl();

  @override
  String toString() {
    return 'HomeState<$T>.representativesSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepresentativesSuccessImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() representativesLoading,
    required TResult Function() representativesSuccess,
    required TResult Function(String message) representativesError,
    required TResult Function(bool status) updateStatus,
  }) {
    return representativesSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? representativesLoading,
    TResult? Function()? representativesSuccess,
    TResult? Function(String message)? representativesError,
    TResult? Function(bool status)? updateStatus,
  }) {
    return representativesSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? representativesLoading,
    TResult Function()? representativesSuccess,
    TResult Function(String message)? representativesError,
    TResult Function(bool status)? updateStatus,
    required TResult orElse(),
  }) {
    if (representativesSuccess != null) {
      return representativesSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RepresentativesLoading<T> value)
        representativesLoading,
    required TResult Function(RepresentativesSuccess<T> value)
        representativesSuccess,
    required TResult Function(RepresentativesError<T> value)
        representativesError,
    required TResult Function(UpdateStatus<T> value) updateStatus,
  }) {
    return representativesSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RepresentativesLoading<T> value)? representativesLoading,
    TResult? Function(RepresentativesSuccess<T> value)? representativesSuccess,
    TResult? Function(RepresentativesError<T> value)? representativesError,
    TResult? Function(UpdateStatus<T> value)? updateStatus,
  }) {
    return representativesSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RepresentativesLoading<T> value)? representativesLoading,
    TResult Function(RepresentativesSuccess<T> value)? representativesSuccess,
    TResult Function(RepresentativesError<T> value)? representativesError,
    TResult Function(UpdateStatus<T> value)? updateStatus,
    required TResult orElse(),
  }) {
    if (representativesSuccess != null) {
      return representativesSuccess(this);
    }
    return orElse();
  }
}

abstract class RepresentativesSuccess<T> implements HomeState<T> {
  const factory RepresentativesSuccess() = _$RepresentativesSuccessImpl<T>;
}

/// @nodoc
abstract class _$$RepresentativesErrorImplCopyWith<T, $Res> {
  factory _$$RepresentativesErrorImplCopyWith(
          _$RepresentativesErrorImpl<T> value,
          $Res Function(_$RepresentativesErrorImpl<T>) then) =
      __$$RepresentativesErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RepresentativesErrorImplCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$RepresentativesErrorImpl<T>>
    implements _$$RepresentativesErrorImplCopyWith<T, $Res> {
  __$$RepresentativesErrorImplCopyWithImpl(_$RepresentativesErrorImpl<T> _value,
      $Res Function(_$RepresentativesErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RepresentativesErrorImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RepresentativesErrorImpl<T> implements RepresentativesError<T> {
  const _$RepresentativesErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'HomeState<$T>.representativesError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepresentativesErrorImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RepresentativesErrorImplCopyWith<T, _$RepresentativesErrorImpl<T>>
      get copyWith => __$$RepresentativesErrorImplCopyWithImpl<T,
          _$RepresentativesErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() representativesLoading,
    required TResult Function() representativesSuccess,
    required TResult Function(String message) representativesError,
    required TResult Function(bool status) updateStatus,
  }) {
    return representativesError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? representativesLoading,
    TResult? Function()? representativesSuccess,
    TResult? Function(String message)? representativesError,
    TResult? Function(bool status)? updateStatus,
  }) {
    return representativesError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? representativesLoading,
    TResult Function()? representativesSuccess,
    TResult Function(String message)? representativesError,
    TResult Function(bool status)? updateStatus,
    required TResult orElse(),
  }) {
    if (representativesError != null) {
      return representativesError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RepresentativesLoading<T> value)
        representativesLoading,
    required TResult Function(RepresentativesSuccess<T> value)
        representativesSuccess,
    required TResult Function(RepresentativesError<T> value)
        representativesError,
    required TResult Function(UpdateStatus<T> value) updateStatus,
  }) {
    return representativesError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RepresentativesLoading<T> value)? representativesLoading,
    TResult? Function(RepresentativesSuccess<T> value)? representativesSuccess,
    TResult? Function(RepresentativesError<T> value)? representativesError,
    TResult? Function(UpdateStatus<T> value)? updateStatus,
  }) {
    return representativesError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RepresentativesLoading<T> value)? representativesLoading,
    TResult Function(RepresentativesSuccess<T> value)? representativesSuccess,
    TResult Function(RepresentativesError<T> value)? representativesError,
    TResult Function(UpdateStatus<T> value)? updateStatus,
    required TResult orElse(),
  }) {
    if (representativesError != null) {
      return representativesError(this);
    }
    return orElse();
  }
}

abstract class RepresentativesError<T> implements HomeState<T> {
  const factory RepresentativesError({required final String message}) =
      _$RepresentativesErrorImpl<T>;

  String get message;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepresentativesErrorImplCopyWith<T, _$RepresentativesErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateStatusImplCopyWith<T, $Res> {
  factory _$$UpdateStatusImplCopyWith(_$UpdateStatusImpl<T> value,
          $Res Function(_$UpdateStatusImpl<T>) then) =
      __$$UpdateStatusImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool status});
}

/// @nodoc
class __$$UpdateStatusImplCopyWithImpl<T, $Res>
    extends _$HomeStateCopyWithImpl<T, $Res, _$UpdateStatusImpl<T>>
    implements _$$UpdateStatusImplCopyWith<T, $Res> {
  __$$UpdateStatusImplCopyWithImpl(
      _$UpdateStatusImpl<T> _value, $Res Function(_$UpdateStatusImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$UpdateStatusImpl<T>(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateStatusImpl<T> implements UpdateStatus<T> {
  const _$UpdateStatusImpl(this.status);

  @override
  final bool status;

  @override
  String toString() {
    return 'HomeState<$T>.updateStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStatusImpl<T> &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStatusImplCopyWith<T, _$UpdateStatusImpl<T>> get copyWith =>
      __$$UpdateStatusImplCopyWithImpl<T, _$UpdateStatusImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() representativesLoading,
    required TResult Function() representativesSuccess,
    required TResult Function(String message) representativesError,
    required TResult Function(bool status) updateStatus,
  }) {
    return updateStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? representativesLoading,
    TResult? Function()? representativesSuccess,
    TResult? Function(String message)? representativesError,
    TResult? Function(bool status)? updateStatus,
  }) {
    return updateStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? representativesLoading,
    TResult Function()? representativesSuccess,
    TResult Function(String message)? representativesError,
    TResult Function(bool status)? updateStatus,
    required TResult orElse(),
  }) {
    if (updateStatus != null) {
      return updateStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(RepresentativesLoading<T> value)
        representativesLoading,
    required TResult Function(RepresentativesSuccess<T> value)
        representativesSuccess,
    required TResult Function(RepresentativesError<T> value)
        representativesError,
    required TResult Function(UpdateStatus<T> value) updateStatus,
  }) {
    return updateStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(RepresentativesLoading<T> value)? representativesLoading,
    TResult? Function(RepresentativesSuccess<T> value)? representativesSuccess,
    TResult? Function(RepresentativesError<T> value)? representativesError,
    TResult? Function(UpdateStatus<T> value)? updateStatus,
  }) {
    return updateStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(RepresentativesLoading<T> value)? representativesLoading,
    TResult Function(RepresentativesSuccess<T> value)? representativesSuccess,
    TResult Function(RepresentativesError<T> value)? representativesError,
    TResult Function(UpdateStatus<T> value)? updateStatus,
    required TResult orElse(),
  }) {
    if (updateStatus != null) {
      return updateStatus(this);
    }
    return orElse();
  }
}

abstract class UpdateStatus<T> implements HomeState<T> {
  const factory UpdateStatus(final bool status) = _$UpdateStatusImpl<T>;

  bool get status;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStatusImplCopyWith<T, _$UpdateStatusImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
