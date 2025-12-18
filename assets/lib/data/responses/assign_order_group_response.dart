// import 'package:json_annotation/json_annotation.dart';
// part 'assign_order_group_response.g.dart';

// @JsonSerializable()
// class BaseResponse {
//   @JsonKey(name: 'message')
//   String? message;

//   @JsonKey(name: 'statusCode')
//   int? statusCode;
// }

// @JsonSerializable()
// class AssignOrderGroupResponse extends BaseResponse {
//   @JsonKey(name: 'data')
//   AssignOrderGroupResponseData? data;

//   AssignOrderGroupResponse(
//     this.data,
//   );

//    factory AssignOrderGroupResponse.fromJson(Map<String, dynamic> json) =>
//       _$AssignOrderGroupResponseFromJson(json);
//   Map<String, dynamic> toJson() => _$AssignOrderGroupResponseToJson(this);
// }

// @JsonSerializable()
// class AssignOrderGroupResponseData {
//   @JsonKey(name: 'assignmentCode')
//   String? assignmentCode;

//   @JsonKey(name: 'orderGroups')
//   List<String>? orderGroups;

//   AssignOrderGroupResponseData(
//     this.assignmentCode,
//     this.orderGroups,
//   );

//   factory AssignOrderGroupResponseData.fromJson(Map<String, dynamic> json) =>
//       _$AssignOrderGroupResponseDataFromJson(json);
//   Map<String, dynamic> toJson() => _$AssignOrderGroupResponseDataToJson(this);
// }
