import 'package:balasamajam/general/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'expense_response_model.g.dart';

@JsonSerializable()
class ExpenseResponseModel extends BaseModel {
  ExpenseResponseModel(super.status, super.message);

  factory ExpenseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseResponseModelFromJson(json);
}
