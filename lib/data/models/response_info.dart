// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_info.freezed.dart';
part 'response_info.g.dart';

@freezed
class ResponseInfo with _$ResponseInfo {
  @JsonSerializable(explicitToJson: true)

  const factory ResponseInfo({
    @JsonKey(name: 'code')
    @Default(0) int code,
    @JsonKey(name: 'message')
    @Default('') String message,
    @JsonKey(name: 'data')
    @Default(null) Object? data,
  }) = _ResponseInfo;

  factory ResponseInfo.fromJson(Map<String, Object?> json)
  => _$ResponseInfoFromJson(json);
}