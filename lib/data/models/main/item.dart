// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.freezed.dart';
part 'item.g.dart';

@freezed
class Item with _$Item {
  @JsonSerializable(explicitToJson: true)

  const factory Item({
    @JsonKey(name: 'item_id')
    @Default(0) int itemId,
    @JsonKey(name: 'name')
    @Default('') String name,
    @JsonKey(name: 'figure_type')
    @Default('') String figureType,
    @JsonKey(name: 'color')
    @Default('') String color,
    @JsonKey(name: 'price')
    @Default(0) int price,
  }) = _Item;

  factory Item.fromJson(Map<String, Object?> json)
  => _$ItemFromJson(json);
}