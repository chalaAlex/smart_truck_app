// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assign_order_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..message = json['message'] as String?
  ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
    };

AssignOrderGroupResponse _$AssignOrderGroupResponseFromJson(
        Map<String, dynamic> json) =>
    AssignOrderGroupResponse(
      json['data'] == null
          ? null
          : AssignOrderGroupResponseData.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..message = json['message'] as String?
      ..statusCode = (json['statusCode'] as num?)?.toInt();

Map<String, dynamic> _$AssignOrderGroupResponseToJson(
        AssignOrderGroupResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statusCode': instance.statusCode,
      'data': instance.data,
    };

AssignOrderGroupResponseData _$AssignOrderGroupResponseDataFromJson(
        Map<String, dynamic> json) =>
    AssignOrderGroupResponseData(
      json['assignmentCode'] as String?,
      (json['orderGroups'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AssignOrderGroupResponseDataToJson(
        AssignOrderGroupResponseData instance) =>
    <String, dynamic>{
      'assignmentCode': instance.assignmentCode,
      'orderGroups': instance.orderGroups,
    };
