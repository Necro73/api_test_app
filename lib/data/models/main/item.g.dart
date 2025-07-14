// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemImpl _$$ItemImplFromJson(Map<String, dynamic> json) => _$ItemImpl(
      itemId: (json['item_id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      figureType: json['figure_type'] as String? ?? '',
      color: json['color'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'name': instance.name,
      'figure_type': instance.figureType,
      'color': instance.color,
      'price': instance.price,
    };
