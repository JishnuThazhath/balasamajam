import 'package:json_annotation/json_annotation.dart';

part 'add_expense_response_model.g.dart';

@JsonSerializable()
class AddExpenseResponseModel {
  AddExpenseResponseModel();

  factory AddExpenseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddExpenseResponseModelFromJson(json);
}
