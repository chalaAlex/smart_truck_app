
// import 'package:easy_logistics/data/responses/assign_order_group_response.dart';
// import 'package:easy_logistics/data/network/app_api.dart';
// import 'package:easy_logistics/data/requests/requests.dart';

// abstract class RemoteDataSource {
// // // POST endpoinst
// //   Future<LoginResponse> login(
// //     LoginRequest loginRequest,
// //   );

// //   Future<CreateOrderResponse> orderCreate(
// //     CreateOrderRequest createOrderRequest,
// //   );

// //   Future<OtpRequestResponse> otpRequest(
// //     OtpRequest otpRequest,
// //   );

// //   Future<VerifyOtpResponse> verifyOtp(
// //     VerifyOtpRequest createOrderRequest,
// //   );

// //   Future<ResetPasswordResponse> resetPassword(
// //     ResetPasswordRequest resetPasswordRequest,
// //   );

// //   Future<CreateOrderGroupResponse> createOrderGroup(
// //     OrderGroupCreateRequest orderGroupCreateRequest,
// //   );

// //   Future<AssignOrderGroupResponse> assignOrderGroups(
// //     AssignOrderGroupRequest assignOrderGroupRequest,
// //   );

// //   Future<AssignOrderResponse> assignOrder(
// //     AssignOrderRequest assignOrderRequest,
// //   );

// // // PATCH endpoints
// //   Future<ChangePasswordResponse> changePassword(
// //     ChangePasswordRequest changePasswordRequest,
// //   );

// //   Future<AgentUpdateResponse> updateProfile(
// //     AgentUpdateRequest changePasswordRequest,
// //   );

// // // GET endpoints
// //   Future<OrderListResponse> getOrders();
// //   Future<LocationResponse> getLocations();

// //   Future<OrderFilterListResponse> getOrderFilter(
// //       OrderFilterRequest orderFilterRequest);

// //   Future<GetOrderGroupResponse> getOrderGroup();

// //   Future<GetCarrierResponse> getCarriers(GetCarrierRequest getCarrierRequest);

// //   Future<OrderGroupResponseFilter> getOrderGroupFilter(
// //     OrderGroupFilterRequest orderGroupFilterRequest,
// //   );

// //   // Delete Order Group
// //   Future<OrderGroupDeleteResponse> deleteOrderGroup(
// //       DeleteOrderGroupRequest deleteOrderGroupRequest);

// //   Future<CategoriesResponse> getCategories();
// //   Future<ResourcesResponse> getResources();
// //   Future<ResourcesResponse> getUserResources();
// //   Future<ResourcesResponse> getInstructorResources();
// }

// class RemoteDataSourceImplementor implements RemoteDataSource {
//   RemoteDataSourceImplementor(this._appServiceClient);

//   AppServiceClient _appServiceClient;
// // // POST enpoints

// //   @override
// //   Future<LoginResponse> login(LoginRequest loginRequest) async {
// //     return await _appServiceClient.login(
// //         loginRequest.email, loginRequest.password);
// //   }

// //   @override
// //   Future<CreateOrderResponse> orderCreate(
// //       CreateOrderRequest createOrderRequest) async {
// //     return await _appServiceClient.createOrder(
// //       createOrderRequest.itemName,
// //       createOrderRequest.senderName,
// //       createOrderRequest.receiverName,
// //       createOrderRequest.agentName,
// //       createOrderRequest.price,
// //       createOrderRequest.senderPhone,
// //       createOrderRequest.receiverPhone,
// //       createOrderRequest.weight,
// //       createOrderRequest.weightUnit,
// //       createOrderRequest.origin,
// //       createOrderRequest.destination,
// //       createOrderRequest.urgency,
// //       createOrderRequest.category,
// //       createOrderRequest.estimatedDeliveryTime,
// //     );
// //   }

// //   @override
// //   Future<OtpRequestResponse> otpRequest(OtpRequest otpRequest) async {
// //     return await _appServiceClient.otpRequet(
// //       otpRequest.phoneNumber,
// //     );
// //   }

// //   @override
// //   Future<VerifyOtpResponse> verifyOtp(VerifyOtpRequest verifyOtpRequest) async {
// //     return await _appServiceClient.verifyOtp(
// //       verifyOtpRequest.phoneNumber,
// //       verifyOtpRequest.otp,
// //     );
// //   }

// //   @override
// //   Future<ResetPasswordResponse> resetPassword(
// //       ResetPasswordRequest resetPasswordRequest) async {
// //     return await _appServiceClient.resetPassword(
// //       resetPasswordRequest.phoneNumber,
// //       resetPasswordRequest.otp,
// //       resetPasswordRequest.newPassword,
// //     );
// //   }

// //   @override
// //   Future<CreateOrderGroupResponse> createOrderGroup(
// //       OrderGroupCreateRequest orderGroupCreateRequest) async {
// //     return await _appServiceClient.createOrderGroups(
// //       orderGroupCreateRequest.items,
// //       orderGroupCreateRequest.itemType,
// //       orderGroupCreateRequest.urgency,
// //       orderGroupCreateRequest.weight,
// //       orderGroupCreateRequest.weightUnit,
// //       orderGroupCreateRequest.origin,
// //       orderGroupCreateRequest.destination,
// //     );
// //   }

// //   //Assign Order Group

// //   @override
// //   Future<AssignOrderGroupResponse> assignOrderGroups(
// //       AssignOrderGroupRequest assignOrderGroupRequest) async {
// //     return await _appServiceClient.assignOrderGroups(
// //       assignOrderGroupRequest.carriercode,
// //       assignOrderGroupRequest.orderGroupcodes,
// //     );
// //   }

  
// //   // Assign Order to Carrier  
// //   @override
// //   Future<AssignOrderResponse> assignOrder(AssignOrderRequest assignOrderRequest) async{
// //     return await _appServiceClient.assignOrder(
// //       assignOrderRequest.carriercode,
// //       assignOrderRequest.ordercodes,
// //     );
// //   }

// // // PATCH endpoints
// //   @override
// //   Future<ChangePasswordResponse> changePassword(
// //       ChangePasswordRequest changePasswordRequest) async {
// //     return await _appServiceClient.changePassword(
// //         changePasswordRequest.userId,
// //         changePasswordRequest.currentPassword,
// //         changePasswordRequest.newPassword);
// //   }

// //   @override
// //   Future<AgentUpdateResponse> updateProfile(
// //       AgentUpdateRequest agentUpdateRequest) async {
// //     return await _appServiceClient.updateProfile(
// //         agentUpdateRequest.id,
// //         agentUpdateRequest.fullName,
// //         );
// //   }

// // // GET endpoints
// //   @override
// //   Future<CategoriesResponse> getCategories() {
// //     return _appServiceClient.getCategories();
// //   }

// //   // Get Locations
// //   @override
// //   Future<LocationResponse> getLocations() {
// //     return _appServiceClient.getLocations();
// //   }

// //   @override
// //   Future<OrderFilterListResponse> getOrderFilter(
// //       OrderFilterRequest orderFilterRequest) async {
// //     return await _appServiceClient.getOrderByFilter(
// //       orderFilterRequest.agentId,
// //       orderFilterRequest.search,
// //       orderFilterRequest.destination,
// //       orderFilterRequest.itemType,
// //       orderFilterRequest.urgency,
// //       orderFilterRequest.page,
// //       orderFilterRequest.limit,
// //       orderFilterRequest.origin,
// //     );
// //   }

// //   // Get order group
// //   @override
// //   Future<GetOrderGroupResponse> getOrderGroup() async {
// //     return await _appServiceClient.getOrderGroup();
// //   }

// //   // Get Carrier
// //   @override
// //   Future<GetCarrierResponse> getCarriers(
// //       GetCarrierRequest getCarrierRequest) async {
// //     return await _appServiceClient.getCarriers(
// //       getCarrierRequest.sourceOrdestination1,
// //       getCarrierRequest.sourceOrdestination2,
// //       getCarrierRequest.page,
// //       getCarrierRequest.limit,
// //     );
// //   }

// //   // getOrderGroupFilter
// //   @override
// //   Future<OrderGroupResponseFilter> getOrderGroupFilter(
// //       OrderGroupFilterRequest orderGroupFilterRequest) async {
// //     return await _appServiceClient.getOrderGroupByFilter(
// //         orderGroupFilterRequest.itemType,
// //         orderGroupFilterRequest.weight,
// //         orderGroupFilterRequest.urgency,
// //         orderGroupFilterRequest.destination,
// //         orderGroupFilterRequest.origin,
// //         orderGroupFilterRequest.page,
// //         orderGroupFilterRequest.limit);
// //   }

// //   // Delete order group
// //   @override
// //   Future<OrderGroupDeleteResponse> deleteOrderGroup(
// //       DeleteOrderGroupRequest deleteOrderGroupRequest) async {
// //     return await _appServiceClient.deleteOrderGroup(deleteOrderGroupRequest.id);
// //   }

// //   @override
// //   Future<ResourcesResponse> getResources() {
// //     return _appServiceClient.getResources();
// //   }

// //   @override
// //   Future<ResourcesResponse> getUserResources() {
// //     return _appServiceClient.getUserResources();
// //   }

// //   @override
// //   Future<ResourcesResponse> getInstructorResources() {
// //     return _appServiceClient.getInstructorResources();
// //   }

// //   @override
// //   Future<OrderListResponse> getOrders() {
// //     return _appServiceClient.getOrders();
//   }