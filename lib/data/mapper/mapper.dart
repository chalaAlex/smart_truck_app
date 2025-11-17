import 'package:easy_logistics/app/extensions.dart';
import 'package:easy_logistics/data/mapper/order_model.dart';
import 'package:easy_logistics/data/responses/assign_order_group_response.dart';
import 'package:easy_logistics/data/responses/assign_order_response.dart';
import 'package:easy_logistics/data/responses/change_password_request.dart';
import 'package:easy_logistics/data/responses/delete_order_group_response.dart';
import 'package:easy_logistics/data/responses/get_carrier_response.dart';
import 'package:easy_logistics/data/responses/get_order_group_response.dart';
import 'package:easy_logistics/data/responses/location_response.dart';
import 'package:easy_logistics/data/responses/orderGroupResponseFilter.dart';
import 'package:easy_logistics/data/responses/order_response.dart';
import 'package:easy_logistics/data/responses/otp_request_response.dart';
import 'package:easy_logistics/data/responses/set_password_response.dart';
import 'package:easy_logistics/data/responses/update_profile_response.dart';
import 'package:easy_logistics/data/responses/user_responses.dart';
import 'package:easy_logistics/data/responses/verify_otp_response.dart';
import 'package:easy_logistics/domain/model/assign_order_group_model.dart';
import 'package:easy_logistics/domain/model/assign_order_model.dart';
import 'package:easy_logistics/domain/model/change_password_model.dart';
import 'package:easy_logistics/domain/model/delete_order_group_model.dart';
import 'package:easy_logistics/domain/model/get_carriers_model.dart';
import 'package:easy_logistics/domain/model/get_order_group_model.dart';
import 'package:easy_logistics/domain/model/location_model.dart';
import 'package:easy_logistics/domain/model/orderGroupFilterModel.dart' hide Orders;
import 'package:easy_logistics/domain/model/otp_request_model.dart';
import 'package:easy_logistics/domain/model/set_new_passwor_model.dart';
import 'package:easy_logistics/domain/model/update_profile_model.dart';
import 'package:easy_logistics/domain/model/user_model.dart';
import 'package:easy_logistics/domain/model/verify_otp_model.dart';
// import 'package:flutter/foundation.dart' hide Category;

const EMPTY = "";
const ZERO = 0;
const TRUE = true;
const FALSE = false;

// Login mapper
extension LoginResponseDataMapper on LoginResponseData? {
  LoginData toDomain() {
    return LoginData(
      this?.id ?? '',
      this?.token ?? '',
      this?.fullName ?? '',
      this?.phoneNumber ?? '',
      this?.email ?? '',
      this?.role ?? '',
      this?.region ?? '',
      this?.zone ?? '',
      this?.wereda ?? '',
    );
  }
}

extension LoginResponseMapper on LoginResponse? {
  LoginResponseCon toDomain() {
    return LoginResponseCon(
      this?.data?.toDomain(),
    );
  }
}

// // Location Response Mapper
extension CityResponseMapper on CityResponse? {
  CityModel toDomain() {
    return CityModel(
      this?.id ?? '',
      this?.city ?? '',
      this?.region ?? '',
      this?.isSubcity ?? false,
    );
  }
}

// cities mapper
extension LocationResponseMapper on LocationResponse? {
  LocationModel toDomain() {
    List<CityModel> cities =
        this?.data?.map((city) => city.toDomain()).toList() ?? [];
    return LocationModel(
      this?.total ?? 0,
      cities,
    );
  }
}

// // Order response mapper
// Agent mapper
extension AgentMapper on Agent? {
  AgentModel toDomain() {
    return AgentModel(
      id: this?.id.orEmpty() ?? EMPTY,
      fullName: this?.fullName.orEmpty() ?? EMPTY,
      phone: this?.phone.orEmpty() ?? EMPTY,
      email: this?.email.orEmpty() ?? EMPTY,
      region: this?.region.orEmpty() ?? EMPTY,
      zone: this?.zone.orEmpty() ?? EMPTY,
      wereda: this?.wereda.orEmpty() ?? EMPTY,
    );
  }
}

// Order response mapper
extension OrderResponseMapper on OrderResponse? {
  OrderModel toDomain() {
    return OrderModel(
      id: this?.id.orEmpty() ?? EMPTY,
      orderCode: this?.orderCode.orEmpty() ?? EMPTY,
      createdAt: this?.createdAt.orEmpty() ?? EMPTY,
      itemName: this?.itemName.orEmpty() ?? EMPTY,
      senderName: this?.senderName.orEmpty() ?? EMPTY,
      receiverName: this?.receiverName.orEmpty() ?? EMPTY,
      price: this?.price.orEmpty() ?? EMPTY,
      senderPhone: this?.senderPhone.orEmpty() ?? EMPTY,
      receiverPhone: this?.receiverPhone.orEmpty() ?? EMPTY,
      weight: this?.weight.orEmpty() ?? EMPTY,
      origin: this?.origin.orEmpty() ?? EMPTY,
      weightUnit: this?.weightUnit.orEmpty() ?? EMPTY,
      destination: this?.destination.orEmpty() ?? EMPTY,
      agentReceiverId: this?.agentReceiverId.orEmpty() ?? EMPTY,
      status: this?.status.orEmpty() ?? EMPTY,
      urgency: this?.urgency.orEmpty() ?? EMPTY,
      estimatedDeliveryTime: this?.estimatedDeliveryTime.orEmpty() ?? EMPTY,
      agent: this?.agent.toDomain(),
    );
  }
}

// Order list response mapper
extension OrderListResponseMapper on OrderListResponse? {
  OrderListModel toDomain() {
    List<OrderModel> orders =
        this?.data?.map((order) => order.toDomain()).toList() ?? [];

    return OrderListModel(orders);
  }
}

// Change Password
extension ChangePasswordResponseMapper on ChangePasswordResponse? {
  ChangePasswordModel toDomain() {
    return ChangePasswordModel(
      this?.message?.orEmpty() ?? EMPTY,
    );
  }
}

// Otp response mapper
extension OtpRequestResponseMapper on OtpRequestResponse? {
  OtpRequestModel toDomain() {
    return OtpRequestModel(
      this?.data?.toDomain(),
    );
  }
}

extension OtpRequestResponseDataMapper on OtpRequestResponseData? {
  OtpRequestResponseModel toDomain() {
    return OtpRequestResponseModel(
      this?.phoneNumber?.orEmpty() ?? EMPTY,
      this?.otp?.orEmpty() ?? EMPTY,
      this?.expiresInMinutes ?? 0,
    );
  }
}

// verify otp mapper
extension VerifyOtpResponseMapper on VerifyOtpResponse? {
  OtpVerifyModel toDomain() {
    return OtpVerifyModel(
      this?.data?.toDomain(),
    );
  }
}

extension VerifyOtpResponseDataMapper on VerifyOtpResponseData? {
  OtpVerifyResponseModel toDomain() {
    return OtpVerifyResponseModel(
      this?.phoneNumber?.orEmpty() ?? EMPTY,
    );
  }
}

// Reset password
extension ResetPasswordResponseMapper on ResetPasswordResponse? {
  ResetPasswordModel toDomain() {
    return ResetPasswordModel(
      message: this?.message?.orEmpty() ?? EMPTY,
      data: this?.data?.toDomain(),
    );
  }
}

extension ResetPasswordResponseDataMapper on ResetPasswordData? {
  ResetPasswordDataModel toDomain() {
    return ResetPasswordDataModel(
      phoneNumber: this?.phoneNumber?.orEmpty() ?? EMPTY,
    );
  }
}

// Update profile mapper
extension AgentUpdateResponseMapper on AgentUpdateResponse? {
  AgentUpdateModel toDomain() {
    return AgentUpdateModel(
      this?.statusCode ?? 0,
      this?.message.orEmpty(),
      this?.data.toDomain(),
    );
  }
}

extension AgentUpdateResponseDataMapper on AgentUpdateResponseData? {
  AgenDatatModel toDomain() {
    return AgenDatatModel(
      this?.id.orEmpty() ?? EMPTY,
      this?.fullName.orEmpty() ?? EMPTY,
      this?.phoneNumber.orEmpty() ?? EMPTY,
      this?.email.orEmpty() ?? EMPTY,
      this?.role.orEmpty() ?? EMPTY,
      this?.region.orEmpty() ?? EMPTY,
      this?.zone.orEmpty() ?? EMPTY,
      this?.wereda.orEmpty() ?? EMPTY,
      this?.createdAt.orEmpty() ?? EMPTY,
      this?.updatedAt.orEmpty() ?? EMPTY,
    );
  }
}

// et order group mapper
extension GetOrderGroupResponseMapper on GetOrderGroupResponse? {
  GetOrderGroupResponseModel toDomain() {
    return GetOrderGroupResponseModel(
      this?.data?.map((e) => e.toDomain()).toList() ?? [],
      this?.total ?? 0,
    );
  }
}

// Per-item mapper
extension GetOrderGroupResponseDataMapper on GetOrderGroupResponseData? {
  GetOrderGroupResponseDataModel toDomain() {
    return GetOrderGroupResponseDataModel(
      this?.id?.orEmpty() ?? EMPTY,
      this?.orderCode?.orEmpty() ?? EMPTY,
      this?.ids ?? [], // Now a List<String>
      this?.itemType?.orEmpty() ?? EMPTY,
      this?.weight?.orEmpty() ?? EMPTY,
      this?.origin?.orEmpty() ?? EMPTY,
      this?.destination?.orEmpty() ?? EMPTY,
      this?.urgency?.orEmpty() ?? EMPTY,
      this?.agent?.orEmpty() ?? EMPTY,
    );
  }
}

// Delete Order Group mapper
extension OrderGroupDeleteResponseMapper on OrderGroupDeleteResponse? {
  OrderGroupDeleteResponseModel toDomain() {
    return OrderGroupDeleteResponseModel(
      this?.data,
    );
  }
}

extension OrderGroupDeleteResponseModelMapper
    on OrderGroupDeleteResponseModel? {
  OrderGroupDeleteResponse toResponse() {
    return OrderGroupDeleteResponse(
      data: this?.data,
    );
  }
}

// Get Carriers Response Mapper
extension GetCarrierResponseMapper on GetCarrierResponse? {
  GetCarriersModel toDomain() {
    List<GetCarriersDataModel> carriers =
        this?.data?.map((carrier) => carrier.toDomain()).toList() ?? [];
    return GetCarriersModel(
      this?.total ?? 0,
      carriers,
    );
  }
}

extension GetCarrierResponseDataMapper on GetCarrierResponseData? {
  GetCarriersDataModel toDomain() {
    return GetCarriersDataModel(
      this?.id?.orEmpty() ?? EMPTY,
      this?.carrierId?.orEmpty() ?? EMPTY,
      this?.driverName?.orEmpty() ?? EMPTY,
      this?.email?.orEmpty() ?? EMPTY,
      this?.phone?.orEmpty() ?? EMPTY,
      this?.sourceOrdestination1?.orEmpty() ?? EMPTY,
      this?.sourceOrdestination2?.orEmpty() ?? EMPTY,
      this?.vehicleType?.orEmpty() ?? EMPTY,
      this?.licensePlate?.orEmpty() ?? EMPTY,
      this?.createdAt?.orEmpty() ?? EMPTY,
      this?.lastWorkedAt?.orEmpty() ?? EMPTY,
    );
  }
}

// Assign Order Group Mapper
extension AssignOrderGroupResponseMapper on AssignOrderGroupResponse? {
  AssignOrderGroupResponseModel toDomain() {
    return AssignOrderGroupResponseModel(
      this?.data.toDomain(),
    );
  }
}

// Assign Order Mapper
extension AssignOrderResponseMapper on AssignOrderResponse? {
  AssignOrderModel toDomain() {
    return AssignOrderModel(
      this?.message,
      this?.assignmentCode,
    );
  }
}

extension AssignOrderGroupResponseDataMapper on AssignOrderGroupResponseData? {
  AssignOrderGroupResponseDataModel toDomain() {
    return AssignOrderGroupResponseDataModel(
      this?.assignmentCode,
      this?.orderGroups ?? [],
    );
  }
}
// Order Group Filter Mapper
extension OrderGroupFilterResponseMapper on OrderGroupResponseFilter? {
  OrderGroupFilterModel toDomain() {
    return OrderGroupFilterModel(
      data: this?.data?.map((e) => e.toDomain()).toList(),
      total: this?.total ?? ZERO,
      message: this?.message ?? EMPTY,
      statusCode: this?.statusCode ?? ZERO,
    );
  }
}

extension OrderGroupResponseFilterDataMapper on OrderGroupFiterResponseData? {
  OrderGroupFilterDataModel toDomain() {
    return OrderGroupFilterDataModel(
      id: this?.id,
      orderCode: this?.orderCode,
      createdAt: this?.createdAt,
      items: this?.items,
      itemType: this?.itemType,
      weight: this?.weight,
      origin: this?.origin?.toString(),
      destination: this?.destination?.toString(),
      urgency: this?.urgency?.toString(),
      orders:this?.orders?.map((e) => e.toDomain()).toList()
    );
  }
}

extension OrdersMapper on Orders? {
  OrdersModel toDomain() {
    return OrdersModel(
      id: this?.id,
      orderCode: this?.orderCode,
      createdAt: this?.createdAt,
      itemName: this?.itemName,
      weightUnit: this?.weightUnit,
      weight: this?.weight,
      origin: this?.origin,
      destination: this?.destination,
      price: this?.price,
      senderName: this?.senderName,
      senderPhone: this?.senderPhone,
      receiverName: this?.receiverName,
      receiverPhone: this?.receiverPhone,
      status: this?.status,
      urgency: this?.urgency,
    );
  }
}