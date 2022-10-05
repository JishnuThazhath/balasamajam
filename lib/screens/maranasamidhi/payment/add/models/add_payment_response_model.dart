import 'package:json_annotation/json_annotation.dart';

part 'add_payment_response_model.g.dart';

@JsonSerializable()
class AddPaymentResponseModel {
  AddPaymentResponseModel();
  factory AddPaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddPaymentResponseModelFromJson(json);
}
