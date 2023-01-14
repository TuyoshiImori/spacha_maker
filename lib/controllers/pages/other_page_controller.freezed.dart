// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'other_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtherPageState {
  bool get isAvailable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtherPageStateCopyWith<OtherPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtherPageStateCopyWith<$Res> {
  factory $OtherPageStateCopyWith(
          OtherPageState value, $Res Function(OtherPageState) then) =
      _$OtherPageStateCopyWithImpl<$Res, OtherPageState>;
  @useResult
  $Res call({bool isAvailable});
}

/// @nodoc
class _$OtherPageStateCopyWithImpl<$Res, $Val extends OtherPageState>
    implements $OtherPageStateCopyWith<$Res> {
  _$OtherPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
  }) {
    return _then(_value.copyWith(
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OtherPageStateCopyWith<$Res>
    implements $OtherPageStateCopyWith<$Res> {
  factory _$$_OtherPageStateCopyWith(
          _$_OtherPageState value, $Res Function(_$_OtherPageState) then) =
      __$$_OtherPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAvailable});
}

/// @nodoc
class __$$_OtherPageStateCopyWithImpl<$Res>
    extends _$OtherPageStateCopyWithImpl<$Res, _$_OtherPageState>
    implements _$$_OtherPageStateCopyWith<$Res> {
  __$$_OtherPageStateCopyWithImpl(
      _$_OtherPageState _value, $Res Function(_$_OtherPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAvailable = null,
  }) {
    return _then(_$_OtherPageState(
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_OtherPageState implements _OtherPageState {
  const _$_OtherPageState({this.isAvailable = false});

  @override
  @JsonKey()
  final bool isAvailable;

  @override
  String toString() {
    return 'OtherPageState(isAvailable: $isAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OtherPageState &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAvailable);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OtherPageStateCopyWith<_$_OtherPageState> get copyWith =>
      __$$_OtherPageStateCopyWithImpl<_$_OtherPageState>(this, _$identity);
}

abstract class _OtherPageState implements OtherPageState {
  const factory _OtherPageState({final bool isAvailable}) = _$_OtherPageState;

  @override
  bool get isAvailable;
  @override
  @JsonKey(ignore: true)
  _$$_OtherPageStateCopyWith<_$_OtherPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
