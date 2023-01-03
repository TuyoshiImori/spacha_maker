// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'making_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MakingPageState {
  Spacha? get spacha => throw _privateConstructorUsedError;
  File? get iconImage => throw _privateConstructorUsedError;
  bool get isCorner => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MakingPageStateCopyWith<MakingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MakingPageStateCopyWith<$Res> {
  factory $MakingPageStateCopyWith(
          MakingPageState value, $Res Function(MakingPageState) then) =
      _$MakingPageStateCopyWithImpl<$Res, MakingPageState>;
  @useResult
  $Res call({Spacha? spacha, File? iconImage, bool isCorner});

  $SpachaCopyWith<$Res>? get spacha;
}

/// @nodoc
class _$MakingPageStateCopyWithImpl<$Res, $Val extends MakingPageState>
    implements $MakingPageStateCopyWith<$Res> {
  _$MakingPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spacha = freezed,
    Object? iconImage = freezed,
    Object? isCorner = null,
  }) {
    return _then(_value.copyWith(
      spacha: freezed == spacha
          ? _value.spacha
          : spacha // ignore: cast_nullable_to_non_nullable
              as Spacha?,
      iconImage: freezed == iconImage
          ? _value.iconImage
          : iconImage // ignore: cast_nullable_to_non_nullable
              as File?,
      isCorner: null == isCorner
          ? _value.isCorner
          : isCorner // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SpachaCopyWith<$Res>? get spacha {
    if (_value.spacha == null) {
      return null;
    }

    return $SpachaCopyWith<$Res>(_value.spacha!, (value) {
      return _then(_value.copyWith(spacha: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MakingPageStateCopyWith<$Res>
    implements $MakingPageStateCopyWith<$Res> {
  factory _$$_MakingPageStateCopyWith(
          _$_MakingPageState value, $Res Function(_$_MakingPageState) then) =
      __$$_MakingPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Spacha? spacha, File? iconImage, bool isCorner});

  @override
  $SpachaCopyWith<$Res>? get spacha;
}

/// @nodoc
class __$$_MakingPageStateCopyWithImpl<$Res>
    extends _$MakingPageStateCopyWithImpl<$Res, _$_MakingPageState>
    implements _$$_MakingPageStateCopyWith<$Res> {
  __$$_MakingPageStateCopyWithImpl(
      _$_MakingPageState _value, $Res Function(_$_MakingPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spacha = freezed,
    Object? iconImage = freezed,
    Object? isCorner = null,
  }) {
    return _then(_$_MakingPageState(
      spacha: freezed == spacha
          ? _value.spacha
          : spacha // ignore: cast_nullable_to_non_nullable
              as Spacha?,
      iconImage: freezed == iconImage
          ? _value.iconImage
          : iconImage // ignore: cast_nullable_to_non_nullable
              as File?,
      isCorner: null == isCorner
          ? _value.isCorner
          : isCorner // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MakingPageState implements _MakingPageState {
  const _$_MakingPageState(
      {this.spacha, this.iconImage, this.isCorner = false});

  @override
  final Spacha? spacha;
  @override
  final File? iconImage;
  @override
  @JsonKey()
  final bool isCorner;

  @override
  String toString() {
    return 'MakingPageState(spacha: $spacha, iconImage: $iconImage, isCorner: $isCorner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MakingPageState &&
            (identical(other.spacha, spacha) || other.spacha == spacha) &&
            (identical(other.iconImage, iconImage) ||
                other.iconImage == iconImage) &&
            (identical(other.isCorner, isCorner) ||
                other.isCorner == isCorner));
  }

  @override
  int get hashCode => Object.hash(runtimeType, spacha, iconImage, isCorner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MakingPageStateCopyWith<_$_MakingPageState> get copyWith =>
      __$$_MakingPageStateCopyWithImpl<_$_MakingPageState>(this, _$identity);
}

abstract class _MakingPageState implements MakingPageState {
  const factory _MakingPageState(
      {final Spacha? spacha,
      final File? iconImage,
      final bool isCorner}) = _$_MakingPageState;

  @override
  Spacha? get spacha;
  @override
  File? get iconImage;
  @override
  bool get isCorner;
  @override
  @JsonKey(ignore: true)
  _$$_MakingPageStateCopyWith<_$_MakingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
