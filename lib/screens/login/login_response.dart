import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String token;
  final String firstName;
  final String lastName;
  final String phone;
  final String address;
  final String adminId;

  LoginResponse(this.token, this.firstName, this.lastName, this.phone,
      this.address, this.adminId);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
