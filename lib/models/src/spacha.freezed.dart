// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spacha.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Spacha _$SpachaFromJson(Map<String, dynamic> json) {
  return _Spacha.fromJson(json);
}

/// @nodoc
mixin _$Spacha {
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpachaCopyWith<Spacha> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpachaCopyWith<$Res> {
  factory $SpachaCopyWith(Spacha value, $Res Function(Spacha) then) =
      _$SpachaCopyWithImpl<$Res, Spacha>;
  @useResult
  $Res call({String name, int price, String message});
}

/// @nodoc
class _$SpachaCopyWithImpl<$Res, $Val extends Spacha>
    implements $SpachaCopyWith<$Res> {
  _$SpachaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpachaCopyWith<$Res> implements $SpachaCopyWith<$Res> {
  factory _$$_SpachaCopyWith(_$_Spacha value, $Res Function(_$_Spacha) then) =
      __$$_SpachaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int price, String message});
}

/// @nodoc
class __$$_SpachaCopyWithImpl<$Res>
    extends _$SpachaCopyWithImpl<$Res, _$_Spacha>
    implements _$$_SpachaCopyWith<$Res> {
  __$$_SpachaCopyWithImpl(_$_Spacha _value, $Res Function(_$_Spacha) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? message = null,
  }) {
    return _then(_$_Spacha(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Spacha extends _Spacha {
  const _$_Spacha({this.name = '', this.price = 100, this.message = ''})
      : super._();

  factory _$_Spacha.fromJson(Map<String, dynamic> json) =>
      _$$_SpachaFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Spacha(name: $name, price: $price, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Spacha &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, price, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpachaCopyWith<_$_Spacha> get copyWith =>
      __$$_SpachaCopyWithImpl<_$_Spacha>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpachaToJson(
      this,
    );
  }
}

abstract class _Spacha extends Spacha {
  const factory _Spacha(
      {final String name, final int price, final String message}) = _$_Spacha;
  const _Spacha._() : super._();

  factory _Spacha.fromJson(Map<String, dynamic> json) = _$_Spacha.fromJson;

  @override
  String get name;
  @override
  int get price;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_SpachaCopyWith<_$_Spacha> get copyWith =>
      throw _privateConstructorUsedError;
}
