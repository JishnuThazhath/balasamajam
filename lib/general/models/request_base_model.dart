import 'package:json_annotation/json_annotation.dart';

part 'request_base_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class RequestBaseModel<T> {
  final String token;
  final T data;

  RequestBaseModel(this.token, this.data);

  static RequestBaseModel<T> fromJson<T>(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      RequestBaseModel<T>(
        json['token'] as String,
        fromJsonT(json['data']),
      );

  static Map<String, dynamic> toJson<T>(
    RequestBaseModel<T> instance,
    Object? Function(T value) toJsonT,
  ) =>
      <String, dynamic>{
        'token': instance.token,
        'data': toJsonT(instance.data),
      };
}
