import 'package:json_annotation/json_annotation.dart';

part 'fetch_member_response_model.g.dart';

@JsonSerializable()
class FetchMemberResponseModel {
  final String memberFullName;
  final String memberLocalName;
  final String phoneNumber;
  final double maranavari;
  final double masavari;
  final double total;

  FetchMemberResponseModel(this.memberFullName, this.memberLocalName,
      this.maranavari, this.masavari, this.total, this.phoneNumber);

  factory FetchMemberResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FetchMemberResponseModelFromJson(json);
}
