import 'package:easy_logistics/data/mapper/order_model.dart';
import 'package:easy_logistics/data/requests/assign_order_group_request.dart';
import 'package:easy_logistics/data/requests/assign_order_request.dart';
import 'package:easy_logistics/data/requests/change_password_request.dart';
import 'package:easy_logistics/data/requests/create_order_request.dart';
import 'package:easy_logistics/data/requests/delete_order_group_request.dart';
import 'package:easy_logistics/data/requests/get_carrier_request.dart';
import 'package:easy_logistics/data/requests/orderGroupFilterRequest.dart';
import 'package:easy_logistics/data/requests/order_filter_request.dart';
import 'package:easy_logistics/data/requests/order_group_create.dart';
import 'package:easy_logistics/data/requests/otp_request.dart';
import 'package:easy_logistics/data/requests/set_new_password.dart';
import 'package:easy_logistics/data/requests/update_password_request.dart';
import 'package:easy_logistics/data/requests/verify_otp_request.dart';
import 'package:easy_logistics/domain/model/assign_order_group_model.dart';
import 'package:easy_logistics/domain/model/assign_order_model.dart';
import 'package:easy_logistics/domain/model/change_password_model.dart';
import 'package:easy_logistics/domain/model/create_order_group_model.dart';
import 'package:easy_logistics/domain/model/create_order_model.dart';
import 'package:easy_logistics/domain/model/delete_order_group_model.dart';
import 'package:easy_logistics/domain/model/get_carriers_model.dart';
import 'package:easy_logistics/domain/model/get_order_group_model.dart';
import 'package:easy_logistics/domain/model/hobh_model.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_logistics/data/network/failure.dart';
import 'package:easy_logistics/data/requests/requests.dart';
import 'package:easy_logistics/domain/model/location_model.dart';
import 'package:easy_logistics/domain/model/orderFilterModel.dart';
import 'package:easy_logistics/domain/model/orderGroupFilterModel.dart';
import 'package:easy_logistics/domain/model/otp_request_model.dart';
import 'package:easy_logistics/domain/model/set_new_passwor_model.dart';
import 'package:easy_logistics/domain/model/update_profile_model.dart';
import 'package:easy_logistics/domain/model/user_model.dart';
import 'package:easy_logistics/domain/model/verify_otp_model.dart';

abstract class Repository {
// POST endpoints
  Future<Either<Failure, LoginResponseCon>> login(
    LoginRequest loginRequest,
  );

  Future<Either<Failure, CreateOrderModel>> orderCreate(
    CreateOrderRequest createOrderRequest,
  );

  Future<Either<Failure, OtpRequestModel>> otpRequest(
    OtpRequest otpRequest,
  );

  Future<Either<Failure, OtpVerifyModel>> verifyOtp(
    VerifyOtpRequest verifyOtpRequest,
  );

  Future<Either<Failure, ResetPasswordModel>> resetPassword(
    ResetPasswordRequest verifyOtpRequest,
  );

  Future<Either<Failure, CreateOrderGroupResponseModel>> createOrderGroup(
    OrderGroupCreateRequest orderGroupCreateRequest,
  );

// Assign Order Groups
  Future<Either<Failure, AssignOrderGroupResponseModel>> assignOrderGroups(
    AssignOrderGroupRequest assignOrderGroupRequest,
  );

// Assign Carrier to Orders 
  Future<Either<Failure, AssignOrderModel>> assignOrder(
    AssignOrderRequest assignOrderRequest,
  );

// PATCH endpoints
  Future<Either<Failure, ChangePasswordModel>> changePassword(
    ChangePasswordRequest changePasswordRequest,
  );

  Future<Either<Failure, AgentUpdateModel>> updateProfile(
    AgentUpdateRequest agentUpdateRequest,
  );

// GET endpoints
  Future<Either<Failure, LocationModel>> getLocations();
  Future<Either<Failure, OrderListModel>> getOrders();

  Future<Either<Failure, OrderFilterModel>> getOrderFilter(
      OrderFilterRequest orderFilterRequest);

  Future<Either<Failure, GetOrderGroupResponseModel>> getOrderGroup();

  // Order group filter
  Future<Either<Failure, OrderGroupFilterModel>> getOrderGroupFilter(
    OrderGroupFilterRequest orderGroupFilterRequest,
  );

  Future<Either<Failure, GetCarriersModel>> getCarriers(
      GetCarrierRequest getCarrierRequest);

// Delete Order Group
  Future<Either<Failure, OrderGroupDeleteResponseModel>> deleteOrderGroup(
      DeleteOrderGroupRequest deleteOrderGroupRequest);

  Future<Either<Failure, Resources>> getResources();
  Future<Either<Failure, Categories>> getCategories();
  Future<Either<Failure, Resources>> getUserResources();
  Future<Either<Failure, Resources>> getInstructorResources();
}
