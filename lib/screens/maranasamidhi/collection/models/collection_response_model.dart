import 'package:json_annotation/json_annotation.dart';
part 'collection_response_model.g.dart';

@JsonSerializable()
class CollectionResponseModel {
  final String collectedByFullName;

  final String paymentDate;

  final String collectedFromFullName;

  final double paidAmount;

  final String startDate;

  final String endDate;

  CollectionResponseModel(
      this.collectedByFullName,
      this.paymentDate,
      this.collectedFromFullName,
      this.paidAmount,
      this.startDate,
      this.endDate);

  factory CollectionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionResponseModelFromJson(json);
}
