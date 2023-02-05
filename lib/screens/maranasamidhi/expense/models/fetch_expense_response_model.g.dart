// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_expense_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchExpenseResponseModel _$FetchExpenseResponseModelFromJson(
        Map<String, dynamic> json) =>
    FetchExpenseResponseModel(
      $enumDecode(_$ExpenseTypeEnumMap, json['expenseType']),
      json['description'] as String,
      json['date'] as String,
      (json['amount'] as num).toDouble(),
      json['relatedTo'] as String?,
      json['addedBy'] as String,
    );

Map<String, dynamic> _$FetchExpenseResponseModelToJson(
        FetchExpenseResponseModel instance) =>
    <String, dynamic>{
      'expenseType': _$ExpenseTypeEnumMap[instance.expenseType]!,
      'description': instance.description,
      'date': instance.date,
      'amount': instance.amount,
      'relatedTo': instance.relatedTo,
      'addedBy': instance.addedBy,
    };

const _$ExpenseTypeEnumMap = {
  ExpenseType.ALL: 'ALL',
  ExpenseType.MARANAM: 'MARANAM',
  ExpenseType.OTHERS: 'OTHERS',
};
