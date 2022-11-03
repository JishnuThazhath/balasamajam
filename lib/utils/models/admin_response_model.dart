import 'package:json_annotation/json_annotation.dart';

part 'admin_response_model.g.dart';

@JsonSerializable()
class AdminResponseModel {
  final String adminFullName;
  final String adminid;

  AdminResponseModel(this.adminFullName, this.adminid);

  factory AdminResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AdminResponseModelFromJson(json);
}
