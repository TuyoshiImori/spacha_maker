import 'package:freezed_annotation/freezed_annotation.dart';

part 'spacha.freezed.dart';
part 'spacha.g.dart';

@freezed
class Spacha with _$Spacha {
  const factory Spacha({
    @Default('') String name,
    @Default(100) int price,
    @Default('') String message,
  }) = _Spacha;

  const Spacha._();

  factory Spacha.fromJson(Map<String, dynamic> json) => _$SpachaFromJson(json);
}
