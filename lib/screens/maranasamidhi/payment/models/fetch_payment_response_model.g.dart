// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchPaymentResponseModel _$FetchPaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    FetchPaymentResponseModel(
      json['memberFullName'] as String,
      json['collectedByFullName'] as String,
      (json['amount'] as num).toDouble(),
      json['paymentDate'] as String,
    );

Map<String, dynamic> _$FetchPaymentResponseModelToJson(
        FetchPaymentResponseModel instance) =>
    <String, dynamic>{
      'memberFullName': instance.memberFullName,
      'collectedByFullName': instance.collectedByFullName,
      'amount': instance.amount,
      'paymentDate': instance.paymentDate,
    };
