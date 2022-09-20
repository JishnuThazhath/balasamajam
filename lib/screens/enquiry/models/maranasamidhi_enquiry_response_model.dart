import 'package:json_annotation/json_annotation.dart';

part 'maranasamidhi_enquiry_response_model.g.dart';

@JsonSerializable()
class MaranasamidhiEnquiryResponseModel {
  final double totalMaranavariAmount;
  final double totalMasavariAmount;
  final double totalPayableAmount;

  MaranasamidhiEnquiryResponseModel(this.totalMaranavariAmount,
      this.totalMasavariAmount, this.totalPayableAmount);

  factory MaranasamidhiEnquiryResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$MaranasamidhiEnquiryResponseModelFromJson(json);
}
