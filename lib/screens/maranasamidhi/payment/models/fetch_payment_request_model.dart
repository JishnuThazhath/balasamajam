import 'package:json_annotation/json_annotation.dart';

part 'fetch_payment_request_model.g.dart';

@JsonSerializable()
class FetchPaymentRequestModel {
  final String date;
  final String? memberId;
  final String? collectedById;

  FetchPaymentRequestModel(this.date, this.memberId, this.collectedById);

  Map<String, dynamic> toJson() => _$FetchPaymentRequestModelToJson(this);
}
