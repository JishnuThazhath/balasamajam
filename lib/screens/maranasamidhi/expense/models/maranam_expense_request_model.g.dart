// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maranam_expense_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaranamExpenseRequestModel _$MaranamExpenseRequestModelFromJson(
        Map<String, dynamic> json) =>
    MaranamExpenseRequestModel(
      json['expenseDescription'] as String,
      json['expenseDate'] as String,
      json['expenseAmount'] as String,
      json['expenseType'] as String,
    );

Map<String, dynamic> _$MaranamExpenseRequestModelToJson(
        MaranamExpenseRequestModel instance) =>
    <String, dynamic>{
      'expenseDescription': instance.expenseDescription,
      'expenseDate': instance.expenseDate,
      'expenseAmount': instance.expenseAmount,
      'expenseType': instance.expenseType,
    };
