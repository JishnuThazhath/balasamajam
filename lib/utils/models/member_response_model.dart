import 'package:json_annotation/json_annotation.dart';

part 'member_response_model.g.dart';

@JsonSerializable()
class MemberResponseModel {
  final String memberFullName;

  final String memberId;

  MemberResponseModel(this.memberFullName, this.memberId);

  factory MemberResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MemberResponseModelFromJson(json);
}
