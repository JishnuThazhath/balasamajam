import 'package:balasamajam/screens/maranasamidhi/expense/expense_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_expense_request_model.g.dart';

@JsonSerializable()
class AddExpenseRequestModel {
  final String description;

  final String? memberId;

  final double amount;

  final String dateOfDeath;

  final String notes;

  final String addedByAdminId;

  final ExpenseType expenseType;

  AddExpenseRequestModel(this.description, this.memberId, this.amount,
      this.dateOfDeath, this.notes, this.addedByAdminId, this.expenseType);

  Map<String, dynamic> toJson() => _$AddExpenseRequestModelToJson(this);
}
