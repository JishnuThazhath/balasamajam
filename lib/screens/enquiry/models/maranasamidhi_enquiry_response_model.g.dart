// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maranasamidhi_enquiry_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaranasamidhiEnquiryResponseModel _$MaranasamidhiEnquiryResponseModelFromJson(
        Map<String, dynamic> json) =>
    MaranasamidhiEnquiryResponseModel(
      (json['totalMaranavariAmount'] as num).toDouble(),
      (json['totalMasavariAmount'] as num).toDouble(),
      (json['totalPayableAmount'] as num).toDouble(),
      json['name'] as String,
    );

Map<String, dynamic> _$MaranasamidhiEnquiryResponseModelToJson(
        MaranasamidhiEnquiryResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'totalMaranavariAmount': instance.totalMaranavariAmount,
      'totalMasavariAmount': instance.totalMasavariAmount,
      'totalPayableAmount': instance.totalPayableAmount,
    };
