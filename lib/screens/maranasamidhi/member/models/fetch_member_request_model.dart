import 'package:json_annotation/json_annotation.dart';

part 'fetch_member_request_model.g.dart';

@JsonSerializable()
class FetchMemberRequestModel {
  final String? searchText;

  FetchMemberRequestModel(this.searchText);

  Map<String, dynamic> toJson() => _$FetchMemberRequestModelToJson(this);
}
