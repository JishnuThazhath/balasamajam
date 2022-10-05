import 'package:json_annotation/json_annotation.dart';

part 'add_member_request_model.g.dart';

@JsonSerializable()
class AddMemberRequestModel {
  final String fullName;

  final String address;

  final String phone;

  final String localizedFullName;

  AddMemberRequestModel(
      this.fullName, this.address, this.phone, this.localizedFullName);

  Map<String, dynamic> toJson() => _$AddMemberRequestModelToJson(this);
}
