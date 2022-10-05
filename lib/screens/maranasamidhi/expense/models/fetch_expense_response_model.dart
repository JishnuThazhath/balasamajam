import 'package:balasamajam/screens/maranasamidhi/expense/expense_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_expense_response_model.g.dart';

@JsonSerializable()
class FetchExpenseResponseModel {
  final ExpenseType expenseType;
  final String description;
  final String date;
  final double amount;
  final String relatedTo;
  final String addedBy;

  FetchExpenseResponseModel(this.expenseType, this.description, this.date,
      this.amount, this.relatedTo, this.addedBy);

  factory FetchExpenseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FetchExpenseResponseModelFromJson(json);
}
