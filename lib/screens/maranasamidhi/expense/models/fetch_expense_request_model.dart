import 'package:balasamajam/screens/maranasamidhi/expense/expense_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_expense_request_model.g.dart';

@JsonSerializable()
class FetchExpenseRequestModel {
  final ExpenseType expenseType;

  FetchExpenseRequestModel(this.expenseType);

  Map<String, dynamic> toJson() => _$FetchExpenseRequestModelToJson(this);
}
