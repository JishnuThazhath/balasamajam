import 'package:json_annotation/json_annotation.dart';

part 'add_payment_request_model.g.dart';

@JsonSerializable()
class AddPaymentRequestModel {
  final String memberId;
  final String collectedById;
  final double amount;
  final String comments;

  AddPaymentRequestModel(
      this.memberId, this.collectedById, this.amount, this.comments);

  Map<String, dynamic> toJson() => _$AddPaymentRequestModelToJson(this);
}
