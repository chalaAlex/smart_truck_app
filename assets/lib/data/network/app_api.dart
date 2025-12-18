// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:easy_logistics/app/constant.dart';
// part 'app_api.g.dart';

// @RestApi(baseUrl: Constant.baseUrl)
// abstract class AppServiceClient {
//   factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

// // POST ENDPOINTS
//   // @POST("/agents/login")
//   // Future<LoginResponse> login(
//   //   @Field("email") String email,
//   //   @Field("password") String password,
//   // );

// //   @POST("/orders/create")
// //   Future<CreateOrderResponse> createOrder(
// //     @Field("itemName") String? itemName,
// //     @Field("senderName") String? senderName,
// //     @Field("receiverName") String? receiverName,
// //     @Field("agentName") String? agentName,
// //     @Field("price") String? price,
// //     @Field("senderPhone") String? senderPhone,
// //     @Field("receiverPhone") String? receiverPhone,
// //     @Field("weight") double? weight,
// //     @Field("weightUnit") String? weightUnit,
// //     @Field("origin") String? origin,
// //     @Field("destination") String? destination,
// //     @Field("urgency") String? urgency,
// //     @Field("category") String? category,
// //     @Field("estimatedDeliveryTime") String? estimatedDelieryTime,
// //   );

// //   @POST("/agents/request-otp")
// //   Future<OtpRequestResponse> otpRequet(
// //     @Field("phoneNumber") String? phoneNumber,
// //   );

// //   @POST("/agents/verify-otp")
// //   Future<VerifyOtpResponse> verifyOtp(
// //     @Field("phoneNumber") String? phoneNumber,
// //     @Field("otp") String? otp,
// //   );

// //   @POST("/agents/reset-password")
// //   Future<ResetPasswordResponse> resetPassword(
// //     @Field("phoneNumber") String? phoneNumber,
// //     @Field("otp") String? otp,
// //     @Field("newPassword") String? newPassword,
// //   );

// //   @POST("/orderGroups/create")
// //   Future<CreateOrderGroupResponse> createOrderGroups(
// //     @Field("items") List<String>? items,
// //     @Field("itemType") String? itemType,
// //     @Field("urgency") String? urgency,
// //     @Field("weight") double? weight,
// //     @Field("weightUnit") String? weightUnit,
// //     @Field("origin") String? originPlace,
// //     @Field("destination") String? destinationPlace,
// //   );

// //   @POST("/assignments/order-groups")
// //   Future<AssignOrderGroupResponse> assignOrderGroups(
// //     @Field("carriercode") String? carriercode,
// //     @Field("orderGroupcodes") List<String>? orderGroupcodes,
// //   );

// //   // Assign Order to Carrier
// //   @POST("/assignments/orders")
// //   Future<AssignOrderResponse> assignOrder(
// //     @Field("carriercode") String? carriercode,
// //     @Field("ordercodes") List<String>? ordercodes,
// //   );

// // // PATCH ENDPOINTS
// //   @PATCH("/agents/updatePassword/{userId}")
// //   Future<ChangePasswordResponse> changePassword(
// //     @Path("userId") String? userId,
// //     @Field("currentPassword") String? currentPassword,
// //     @Field("newPassword") String? newPassword,
// //   );

// //   @PATCH("/agents/updateProfile/{userId}")
// //   Future<AgentUpdateResponse> updateProfile(
// //     @Path("userId") String? userId,
// //     @Field("fullName") String? fullName
// //     // @Field("phone") String? phone,
// //     // @Field("email") String? email,
// //   );

// // // GET ENDPOINTS
// //   @GET("/orders/findAll")
// //   Future<OrderListResponse> getOrders();

// //   // @GET("/orders/findOne")
// //   // Future<OrderListResponse> getOrders();

// //   @GET("/locations/cities")
// //   Future<LocationResponse> getLocations();

// //   @GET("/orders/findAll")
// //   Future<OrderFilterListResponse> getOrderByFilter(
// //     @Query("agentId") String? agentId,
// //     @Query("search") String? search,
// //     @Query("destination") String? destination,
// //     @Query("itemType") String? itemType,
// //     @Query("urgency") String? urgency,
// //     @Query("page") int? page,
// //     @Query("limit") int? limit,
// //     @Query("origin") String? origin,
// //   );

// //   @GET("/orderGroups/findAll")
// //   Future<GetOrderGroupResponse> getOrderGroup();

// //   // Order Group filter
// //   @GET("/orderGroups/findAll")
// //   Future<OrderGroupResponseFilter> getOrderGroupByFilter(
// //     @Query("itemType") String? itemType,
// //     @Query("weight") double? weight,
// //     @Query("urgency") String? urgency,
// //     @Query("destination") String? destination,
// //     @Query("origin") String? origin,
// //     @Query("page") int? page,
// //     @Query("limit") int? limit,
// //   );

// //   @GET("/carriers/findAll")
// //   Future<GetCarrierResponse> getCarriers(
// //     @Query("route1") String? sourceOrdestination1,
// //     @Query("route2") String? sourceOrdestination2,
// //     @Query("page") int? page,
// //     @Query("limit") int? limit,
// //   );

// // // Detelte Endpoints
// //   @DELETE("/orderGroups/delete/{id}")
// //   Future<OrderGroupDeleteResponse> deleteOrderGroup(
// //     @Path("id") String? userId,
// //   );

// //   @GET("/category")
// //   Future<CategoriesResponse> getCategories();

// //   @GET("/resources")
// //   Future<ResourcesResponse> getResources();

// //   @GET("/resources/user/my-resources")
// //   Future<ResourcesResponse> getUserResources();

// //   @GET("/resources/instructor/my-resources")
// //   Future<ResourcesResponse> getInstructorResources();
// }
