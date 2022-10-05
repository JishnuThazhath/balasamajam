// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_expense_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchExpenseRequestModel _$FetchExpenseRequestModelFromJson(
        Map<String, dynamic> json) =>
    FetchExpenseRequestModel(
      $enumDecode(_$ExpenseTypeEnumMap, json['expenseType']),
    );

Map<String, dynamic> _$FetchExpenseRequestModelToJson(
        FetchExpenseRequestModel instance) =>
    <String, dynamic>{
      'expenseType': _$ExpenseTypeEnumMap[instance.expenseType]!,
    };

const _$ExpenseTypeEnumMap = {
  ExpenseType.ALL: 'ALL',
  ExpenseType.MARANAM: 'MARANAM',
  ExpenseType.OTHERS: 'OTHERS',
};
