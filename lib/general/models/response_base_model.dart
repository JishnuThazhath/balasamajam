class ResponseBaseModel<T> {
  final String status;
  final String message;
  final List<T> data;

  ResponseBaseModel(this.status, this.message, this.data);

  ResponseBaseModel<T> ResponseBaseModelFromJson<T>(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      ResponseBaseModel<T>(
        json['status'] as String,
        json['message'] as String,
        (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      );

  Map<String, dynamic> ResponseBaseModelToJson<T>(
    ResponseBaseModel<T> instance,
    Object? Function(T value) toJsonT,
  ) =>
      <String, dynamic>{
        'status': instance.status,
        'message': instance.message,
        'data': instance.data.map(toJsonT).toList(),
      };
}
