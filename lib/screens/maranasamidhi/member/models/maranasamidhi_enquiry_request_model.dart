import 'package:json_annotation/json_annotation.dart';

part 'maranasamidhi_enquiry_request_model.g.dart';

@JsonSerializable()
class MaranasamidhiEnquiryRequestModel {
  final String searchKey;

  MaranasamidhiEnquiryRequestModel(this.searchKey);

  Map<String, dynamic> toJson() =>
      _$MaranasamidhiEnquiryRequestModelToJson(this);
}
