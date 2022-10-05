// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_member_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchMemberResponseModel _$FetchMemberResponseModelFromJson(
        Map<String, dynamic> json) =>
    FetchMemberResponseModel(
      json['memberFullName'] as String,
      json['memberLocalName'] as String,
      (json['maranavari'] as num).toDouble(),
      (json['masavari'] as num).toDouble(),
      (json['total'] as num).toDouble(),
      json['phoneNumber'] as String,
    );

Map<String, dynamic> _$FetchMemberResponseModelToJson(
        FetchMemberResponseModel instance) =>
    <String, dynamic>{
      'memberFullName': instance.memberFullName,
      'memberLocalName': instance.memberLocalName,
      'phoneNumber': instance.phoneNumber,
      'maranavari': instance.maranavari,
      'masavari': instance.masavari,
      'total': instance.total,
    };
