import 'package:json_annotation/json_annotation.dart';
part 'collection_request_model.g.dart';

@JsonSerializable()
class CollectionRequestModel {
  final String date;

  final String adminId;

  CollectionRequestModel(this.date, this.adminId);

  Map<String, dynamic> toJson() => _$CollectionRequestModelToJson(this);
}
