// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseResponseModel _$ExpenseResponseModelFromJson(
        Map<String, dynamic> json) =>
    ExpenseResponseModel(
      json['status'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$ExpenseResponseModelToJson(
        ExpenseResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
