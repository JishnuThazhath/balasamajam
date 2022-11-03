import 'package:balasamajam/screens/maranasamidhi/payment/models/fetch_payment_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payments_model.g.dart';

@JsonSerializable()
class PaymentsModel {
  final String startDate;
  final String endDate;
  final List<FetchPaymentResponseModel> payments;

  PaymentsModel(this.startDate, this.endDate, this.payments);

  factory PaymentsModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentsModelFromJson(json);
}
