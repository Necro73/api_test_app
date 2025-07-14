// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseInfo _$ResponseInfoFromJson(Map<String, dynamic> json) {
  return _ResponseInfo.fromJson(json);
}

/// @nodoc
mixin _$ResponseInfo {
  @JsonKey(name: 'code')
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Object? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseInfoCopyWith<ResponseInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseInfoCopyWith<$Res> {
  factory $ResponseInfoCopyWith(
          ResponseInfo value, $Res Function(ResponseInfo) then) =
      _$ResponseInfoCopyWithImpl<$Res, ResponseInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') int code,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') Object? data});
}

/// @nodoc
class _$ResponseInfoCopyWithImpl<$Res, $Val extends ResponseInfo>
    implements $ResponseInfoCopyWith<$Res> {
  _$ResponseInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data ? _value.data : data,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseInfoImplCopyWith<$Res>
    implements $ResponseInfoCopyWith<$Res> {
  factory _$$ResponseInfoImplCopyWith(
          _$ResponseInfoImpl value, $Res Function(_$ResponseInfoImpl) then) =
      __$$ResponseInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') int code,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'data') Object? data});
}

/// @nodoc
class __$$ResponseInfoImplCopyWithImpl<$Res>
    extends _$ResponseInfoCopyWithImpl<$Res, _$ResponseInfoImpl>
    implements _$$ResponseInfoImplCopyWith<$Res> {
  __$$ResponseInfoImplCopyWithImpl(
      _$ResponseInfoImpl _value, $Res Function(_$ResponseInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$ResponseInfoImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data ? _value.data : data,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ResponseInfoImpl implements _ResponseInfo {
  const _$ResponseInfoImpl(
      {@JsonKey(name: 'code') this.code = 0,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'data') this.data = null});

  factory _$ResponseInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseInfoImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final int code;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'data')
  final Object? data;

  @override
  String toString() {
    return 'ResponseInfo(code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseInfoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, message, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseInfoImplCopyWith<_$ResponseInfoImpl> get copyWith =>
      __$$ResponseInfoImplCopyWithImpl<_$ResponseInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseInfoImplToJson(
      this,
    );
  }
}

abstract class _ResponseInfo implements ResponseInfo {
  const factory _ResponseInfo(
      {@JsonKey(name: 'code') final int code,
      @JsonKey(name: 'message') final String message,
      @JsonKey(name: 'data') final Object? data}) = _$ResponseInfoImpl;

  factory _ResponseInfo.fromJson(Map<String, dynamic> json) =
      _$ResponseInfoImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  int get code;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'data')
  Object? get data;
  @override
  @JsonKey(ignore: true)
  _$$ResponseInfoImplCopyWith<_$ResponseInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
