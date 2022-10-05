class ResponseBaseModel<T> {
  final String status;
  final String message;
  final List<T> data;

  ResponseBaseModel(this.status, this.message, this.data);

  static ResponseBaseModel<T> fromJson<T>(
    Map<String, T> json,
    T Function(Object? json) fromJsonT,
  ) =>
      ResponseBaseModel<T>(
        json['status'] as String,
        json['message'] as String,
        json['data'] == null
            ? []
            : (json['data'] as List<T>).map((e) => fromJsonT(e)).toList(),
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
