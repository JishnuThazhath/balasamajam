// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestBaseModel<T> _$RequestBaseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    RequestBaseModel<T>(
      json['token'] as String,
      fromJsonT(json['data']),
    );

Map<String, dynamic> _$RequestBaseModelToJson<T>(
  RequestBaseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'token': instance.token,
      'data': toJsonT(instance.data),
    };
