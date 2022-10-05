// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_member_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddMemberRequestModel _$AddMemberRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddMemberRequestModel(
      json['fullName'] as String,
      json['address'] as String,
      json['phone'] as String,
      json['localizedFullName'] as String,
    );

Map<String, dynamic> _$AddMemberRequestModelToJson(
        AddMemberRequestModel instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'address': instance.address,
      'phone': instance.phone,
      'localizedFullName': instance.localizedFullName,
    };
