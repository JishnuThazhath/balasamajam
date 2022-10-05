// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_payment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPaymentRequestModel _$AddPaymentRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddPaymentRequestModel(
      json['memberId'] as String,
      json['collectedById'] as String,
      (json['amount'] as num).toDouble(),
      json['comments'] as String,
    );

Map<String, dynamic> _$AddPaymentRequestModelToJson(
        AddPaymentRequestModel instance) =>
    <String, dynamic>{
      'memberId': instance.memberId,
      'collectedById': instance.collectedById,
      'amount': instance.amount,
      'comments': instance.comments,
    };
