// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_payment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchPaymentRequestModel _$FetchPaymentRequestModelFromJson(
        Map<String, dynamic> json) =>
    FetchPaymentRequestModel(
      json['date'] as String,
      json['memeberId'] as String,
      json['collectedById'] as String,
    );

Map<String, dynamic> _$FetchPaymentRequestModelToJson(
        FetchPaymentRequestModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'memeberId': instance.memeberId,
      'collectedById': instance.collectedById,
    };
