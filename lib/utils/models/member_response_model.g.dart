// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberResponseModel _$MemberResponseModelFromJson(Map<String, dynamic> json) =>
    MemberResponseModel(
      json['memberFullName'] as String,
      json['memberId'] as String,
    );

Map<String, dynamic> _$MemberResponseModelToJson(
        MemberResponseModel instance) =>
    <String, dynamic>{
      'memberFullName': instance.memberFullName,
      'memberId': instance.memberId,
    };
