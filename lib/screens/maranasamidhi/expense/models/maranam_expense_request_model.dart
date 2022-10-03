import 'package:json_annotation/json_annotation.dart';
part 'maranam_expense_request_model.g.dart';

@JsonSerializable()
class MaranamExpenseRequestModel {
  final String expenseDescription;
  final String expenseDate;
  final String expenseAmount;
  final String expenseType;

  MaranamExpenseRequestModel(this.expenseDescription, this.expenseDate,
      this.expenseAmount, this.expenseType);

  Map<String, dynamic> toJson() => _$MaranamExpenseRequestModelToJson(this);
}
