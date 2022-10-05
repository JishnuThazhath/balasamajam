import 'package:json_annotation/json_annotation.dart';

part 'add_member_response_model.g.dart';

@JsonSerializable()
class AddMemberResponseModel {
  AddMemberResponseModel();

  factory AddMemberResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddMemberResponseModelFromJson(json);
}
