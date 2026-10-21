// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_nav_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BottomNavState<BottomNavBarPage> {
  BottomNavBarPage get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BottomNavBarPage page) bottomNavBarState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BottomNavBarPage page)? bottomNavBarState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BottomNavBarPage page)? bottomNavBarState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BottomNavBarState<BottomNavBarPage> value)
        bottomNavBarState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BottomNavBarState<BottomNavBarPage> value)?
        bottomNavBarState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BottomNavBarState<BottomNavBarPage> value)?
        bottomNavBarState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BottomNavState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BottomNavStateCopyWith<BottomNavBarPage, BottomNavState<BottomNavBarPage>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavStateCopyWith<BottomNavBarPage, $Res> {
  factory $BottomNavStateCopyWith(BottomNavState<BottomNavBarPage> value,
          $Res Function(BottomNavState<BottomNavBarPage>) then) =
      _$BottomNavStateCopyWithImpl<BottomNavBarPage, $Res,
          BottomNavState<BottomNavBarPage>>;
  @useResult
  $Res call({BottomNavBarPage page});
}

/// @nodoc
class _$BottomNavStateCopyWithImpl<BottomNavBarPage, $Res,
        $Val extends BottomNavState<BottomNavBarPage>>
    implements $BottomNavStateCopyWith<BottomNavBarPage, $Res> {
  _$BottomNavStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BottomNavState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as BottomNavBarPage,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BottomNavBarStateImplCopyWith<BottomNavBarPage, $Res>
    implements $BottomNavStateCopyWith<BottomNavBarPage, $Res> {
  factory _$$BottomNavBarStateImplCopyWith(
          _$BottomNavBarStateImpl<BottomNavBarPage> value,
          $Res Function(_$BottomNavBarStateImpl<BottomNavBarPage>) then) =
      __$$BottomNavBarStateImplCopyWithImpl<BottomNavBarPage, $Res>;
  @override
  @useResult
  $Res call({BottomNavBarPage page});
}

/// @nodoc
class __$$BottomNavBarStateImplCopyWithImpl<BottomNavBarPage, $Res>
    extends _$BottomNavStateCopyWithImpl<BottomNavBarPage, $Res,
        _$BottomNavBarStateImpl<BottomNavBarPage>>
    implements _$$BottomNavBarStateImplCopyWith<BottomNavBarPage, $Res> {
  __$$BottomNavBarStateImplCopyWithImpl(
      _$BottomNavBarStateImpl<BottomNavBarPage> _value,
      $Res Function(_$BottomNavBarStateImpl<BottomNavBarPage>) _then)
      : super(_value, _then);

  /// Create a copy of BottomNavState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
  }) {
    return _then(_$BottomNavBarStateImpl<BottomNavBarPage>(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as BottomNavBarPage,
    ));
  }
}

/// @nodoc

class _$BottomNavBarStateImpl<BottomNavBarPage>
    implements BottomNavBarState<BottomNavBarPage> {
  const _$BottomNavBarStateImpl({required this.page});

  @override
  final BottomNavBarPage page;

  @override
  String toString() {
    return 'BottomNavState<$BottomNavBarPage>.bottomNavBarState(page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomNavBarStateImpl<BottomNavBarPage> &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(page));

  /// Create a copy of BottomNavState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomNavBarStateImplCopyWith<BottomNavBarPage,
          _$BottomNavBarStateImpl<BottomNavBarPage>>
      get copyWith => __$$BottomNavBarStateImplCopyWithImpl<BottomNavBarPage,
          _$BottomNavBarStateImpl<BottomNavBarPage>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BottomNavBarPage page) bottomNavBarState,
  }) {
    return bottomNavBarState(page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BottomNavBarPage page)? bottomNavBarState,
  }) {
    return bottomNavBarState?.call(page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BottomNavBarPage page)? bottomNavBarState,
    required TResult orElse(),
  }) {
    if (bottomNavBarState != null) {
      return bottomNavBarState(page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BottomNavBarState<BottomNavBarPage> value)
        bottomNavBarState,
  }) {
    return bottomNavBarState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BottomNavBarState<BottomNavBarPage> value)?
        bottomNavBarState,
  }) {
    return bottomNavBarState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BottomNavBarState<BottomNavBarPage> value)?
        bottomNavBarState,
    required TResult orElse(),
  }) {
    if (bottomNavBarState != null) {
      return bottomNavBarState(this);
    }
    return orElse();
  }
}

abstract class BottomNavBarState<BottomNavBarPage>
    implements BottomNavState<BottomNavBarPage> {
  const factory BottomNavBarState({required final BottomNavBarPage page}) =
      _$BottomNavBarStateImpl<BottomNavBarPage>;

  @override
  BottomNavBarPage get page;

  /// Create a copy of BottomNavState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottomNavBarStateImplCopyWith<BottomNavBarPage,
          _$BottomNavBarStateImpl<BottomNavBarPage>>
      get copyWith => throw _privateConstructorUsedError;
}
