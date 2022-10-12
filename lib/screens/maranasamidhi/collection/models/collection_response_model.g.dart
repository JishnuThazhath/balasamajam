// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionResponseModel _$CollectionResponseModelFromJson(
        Map<String, dynamic> json) =>
    CollectionResponseModel(
      json['collectedByFullName'] as String,
      json['paymentDate'] as String,
      json['collectedFromFullName'] as String,
      (json['paidAmount'] as num).toDouble(),
      json['startDate'] as String,
      json['endDate'] as String,
    );

Map<String, dynamic> _$CollectionResponseModelToJson(
        CollectionResponseModel instance) =>
    <String, dynamic>{
      'collectedByFullName': instance.collectedByFullName,
      'paymentDate': instance.paymentDate,
      'collectedFromFullName': instance.collectedFromFullName,
      'paidAmount': instance.paidAmount,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
