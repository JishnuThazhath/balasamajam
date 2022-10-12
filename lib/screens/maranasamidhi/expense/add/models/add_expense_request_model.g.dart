// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_expense_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddExpenseRequestModel _$AddExpenseRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddExpenseRequestModel(
      json['description'] as String,
      json['memberId'] as String?,
      (json['amount'] as num).toDouble(),
      json['dateOfDeath'] as String,
      json['notes'] as String,
      json['addedByAdminId'] as String,
      $enumDecode(_$ExpenseTypeEnumMap, json['expenseType']),
    );

Map<String, dynamic> _$AddExpenseRequestModelToJson(
        AddExpenseRequestModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'memberId': instance.memberId,
      'amount': instance.amount,
      'dateOfDeath': instance.dateOfDeath,
      'notes': instance.notes,
      'addedByAdminId': instance.addedByAdminId,
      'expenseType': _$ExpenseTypeEnumMap[instance.expenseType]!,
    };

const _$ExpenseTypeEnumMap = {
  ExpenseType.ALL: 'ALL',
  ExpenseType.MARANAM: 'MARANAM',
  ExpenseType.OTHERS: 'OTHERS',
};
