// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'printing_page_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PrintingPageState {
  Uint8List? get uint8list => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PrintingPageStateCopyWith<PrintingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrintingPageStateCopyWith<$Res> {
  factory $PrintingPageStateCopyWith(
          PrintingPageState value, $Res Function(PrintingPageState) then) =
      _$PrintingPageStateCopyWithImpl<$Res, PrintingPageState>;
  @useResult
  $Res call({Uint8List? uint8list, bool isSaving});
}

/// @nodoc
class _$PrintingPageStateCopyWithImpl<$Res, $Val extends PrintingPageState>
    implements $PrintingPageStateCopyWith<$Res> {
  _$PrintingPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uint8list = freezed,
    Object? isSaving = null,
  }) {
    return _then(_value.copyWith(
      uint8list: freezed == uint8list
          ? _value.uint8list
          : uint8list // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrintingPageStateCopyWith<$Res>
    implements $PrintingPageStateCopyWith<$Res> {
  factory _$$_PrintingPageStateCopyWith(_$_PrintingPageState value,
          $Res Function(_$_PrintingPageState) then) =
      __$$_PrintingPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Uint8List? uint8list, bool isSaving});
}

/// @nodoc
class __$$_PrintingPageStateCopyWithImpl<$Res>
    extends _$PrintingPageStateCopyWithImpl<$Res, _$_PrintingPageState>
    implements _$$_PrintingPageStateCopyWith<$Res> {
  __$$_PrintingPageStateCopyWithImpl(
      _$_PrintingPageState _value, $Res Function(_$_PrintingPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uint8list = freezed,
    Object? isSaving = null,
  }) {
    return _then(_$_PrintingPageState(
      uint8list: freezed == uint8list
          ? _value.uint8list
          : uint8list // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PrintingPageState implements _PrintingPageState {
  const _$_PrintingPageState({this.uint8list, this.isSaving = false});

  @override
  final Uint8List? uint8list;
  @override
  @JsonKey()
  final bool isSaving;

  @override
  String toString() {
    return 'PrintingPageState(uint8list: $uint8list, isSaving: $isSaving)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrintingPageState &&
            const DeepCollectionEquality().equals(other.uint8list, uint8list) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(uint8list), isSaving);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrintingPageStateCopyWith<_$_PrintingPageState> get copyWith =>
      __$$_PrintingPageStateCopyWithImpl<_$_PrintingPageState>(
          this, _$identity);
}

abstract class _PrintingPageState implements PrintingPageState {
  const factory _PrintingPageState(
      {final Uint8List? uint8list, final bool isSaving}) = _$_PrintingPageState;

  @override
  Uint8List? get uint8list;
  @override
  bool get isSaving;
  @override
  @JsonKey(ignore: true)
  _$$_PrintingPageStateCopyWith<_$_PrintingPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
