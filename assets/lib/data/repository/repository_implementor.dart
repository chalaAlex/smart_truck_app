// import 'package:dartz/dartz.dart' as loginResponse;
// import 'package:easy_logistics/app/app_preferences.dart';
// import 'package:easy_logistics/data/data_source/local_data_source.dart';
// import 'package:easy_logistics/data/data_source/remote_data_source.dart';
// import 'package:easy_logistics/data/network/network_info.dart';
// import 'package:easy_logistics/domain/repository/repository.dart';

// class RepositoryImpelementor extends Repository {
//   RepositoryImpelementor(
//     this._remoteDataSource,
//     this._networkInfo,
//     this._localDataSource,
//     this._appPreferences,
//   );

//   LocalDataSource _localDataSource;
//   NetworkInfo _networkInfo;
//   RemoteDataSource _remoteDataSource;
//         AppPreferences _appPreferences;
  

// // // POST endpoints
// //   @override
// //   Future<Either<Failure, LoginResponseCon>> login(
// //       LoginRequest loginRequest) async {
// //     try {
// //       final response = await _remoteDataSource.login(loginRequest);
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         _appPreferences.saveAgentId(response.toDomain().data!.id!); // Save agent ID
       
// //         return Right(response.toDomain());
// //       } else {
// //         return Left(Failure((FALSE) as int, ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// //   @override
// //   Future<Either<Failure, CreateOrderModel>> orderCreate(
// //       CreateOrderRequest createOrderRequest) async {
// //     try {
// //       final response = await _remoteDataSource.orderCreate(createOrderRequest);
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         return Right(response.toDomain());
// //       } else {
// //         return Left(
// //             Failure(response.statusCode as int, ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// //   @override
// //   Future<Either<Failure, OtpRequestModel>> otpRequest(
// //       OtpRequest otpRequest) async {
// //     try {
// //       final response = await _remoteDataSource.otpRequest(otpRequest);
// //       (response);
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         // success
// //         return Right(response.toDomain());
// //       } else {
// //         // return error logic
// //         return Left(Failure((FALSE ?? ApiInternalStatus.FAILURE) as int,
// //             ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       // logger.e("An error occurred:", error: error);
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// //   @override
// //   Future<loginResponse.Either<Failure, OtpVerifyModel>> verifyOtp(
// //       VerifyOtpRequest verifyOtpRequest) async {
// //     try {
// //       final response = await _remoteDataSource.verifyOtp(verifyOtpRequest);
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         return Right(response.toDomain());
// //       } else {
// //         return Left(Failure((FALSE ?? ApiInternalStatus.FAILURE) as int,
// //             ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       // logger.e("An error occurred:", error: error);
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// //   @override
// //   Future<Either<Failure, ResetPasswordModel>> resetPassword(
// //       ResetPasswordRequest verifyOtpRequest) async {
// //     try {
// //       final response = await _remoteDataSource.resetPassword(verifyOtpRequest);
// //       (response);
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         // success
// //         return Right(response.toDomain());
// //       } else {
// //         // return error logic
// //         return Left(Failure((FALSE ?? ApiInternalStatus.FAILURE) as int,
// //             ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       // logger.e("An error occurred:", error: error);
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// //   @override
// //   Future<Either<Failure, CreateOrderGroupResponseModel>> createOrderGroup(
// //       OrderGroupCreateRequest orderGroupCreateRequest) async {
// //     try {
// //       final response =
// //           await _remoteDataSource.createOrderGroup(orderGroupCreateRequest);
// //       (response);
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         // success
// //         return Right(response.toDomain());
// //       } else {
// //         // return error logic
// //         return Left(Failure((FALSE) as int, ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       // logger.e("An error occurred:", error: error);
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// // // PATCH endpoints
// //   @override
// //   Future<Either<Failure, ChangePasswordModel>> changePassword(
// //       ChangePasswordRequest changePasswordRequest) async {
// //     try {
// //       final response =
// //           await _remoteDataSource.changePassword(changePasswordRequest);
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         // success
// //         return Right(response.toDomain());
// //       } else {
// //         // return error logic
// //         return Left(Failure((FALSE ?? ApiInternalStatus.FAILURE) as int,
// //             ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// //   @override
// //   Future<loginResponse.Either<Failure, AgentUpdateModel>> updateProfile(
// //       AgentUpdateRequest agentUpdateRequest) async {
// //     try {
// //       final response =
// //           await _remoteDataSource.updateProfile(agentUpdateRequest);
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         return Right(response.toDomain());
// //       } else {
// //         return Left(Failure((FALSE ?? ApiInternalStatus.FAILURE) as int,
// //             ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// //   // Assign Order Groups
// //   @override
// //   Future<Either<Failure, AssignOrderGroupResponseModel>> assignOrderGroups(
// //       AssignOrderGroupRequest assignOrderGroupRequest) async {
// //     try {
// //       final response =
// //           await _remoteDataSource.assignOrderGroups(assignOrderGroupRequest);
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         return Right(response.toDomain());
// //       } else {
// //         return Left(Failure((FALSE ?? ApiInternalStatus.FAILURE) as int,
// //             ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// //   // Assign Orders to carriers

// //   @override
// //   Future<Either<Failure, AssignOrderModel>>
// //       assignOrder(AssignOrderRequest assignOrderRequest) async {
// //     try {
// //       final response = await _remoteDataSource.assignOrder(assignOrderRequest);
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         return Right(response.toDomain());
// //       } else {
// //         return Left(Failure((FALSE ?? ApiInternalStatus.FAILURE) as int,
// //             ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// // // GET endpoints
// //   @override
// //   Future<Either<Failure, OrderListModel>> getOrders() async {
// //     try {
// //       final response = await _remoteDataSource.getOrders();
// //       (response);
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         // success

// //         return Right(response.toDomain());
// //       } else {
// //         // return error logic
// //         return Left(Failure((FALSE ?? ApiInternalStatus.FAILURE) as int,
// //             ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       // logger.e("An error occurred:", error: error);
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// //   @override
// //   Future<loginResponse.Either<Failure, LocationModel>> getLocations() async {
// //     try {
// //       final response = await _remoteDataSource.getLocations();

// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         return Right(response.toDomain());
// //       } else {
// //         return Left(Failure((FALSE ?? ApiInternalStatus.FAILURE) as int,
// //             ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// //   @override
// //   Future<Either<Failure, OrderFilterModel>> getOrderFilter(
// //       OrderFilterRequest orderFilterRequest) async {
// //     if (await _networkInfo.isConnected) {
// //       try {
// //         final response = await _remoteDataSource.getOrderFilter(
// //           OrderFilterRequest(
// //             orderFilterRequest.agentId,
// //             orderFilterRequest.search,
// //             orderFilterRequest.destination,
// //             orderFilterRequest.itemType,
// //             orderFilterRequest.urgency,
// //             orderFilterRequest.page,
// //             orderFilterRequest.limit,
// //             orderFilterRequest.origin,
// //           ),
// //         );

// //         if (response.statusCode == 200 || response.statusCode == 201) {
// //           return Right(response.toDomain());
// //         } else if (response.statusCode == 404) {
// //           return Left(Failure(FALSE as int, ResponseMessage.NOTFOUND));
// //         } else {
// //           return Left(Failure(FALSE as int, ResponseMessage.DEFAULT));
// //         }
// //       } catch (error) {
// //         return Left(ErrorHandler.handle(error).failure);
// //       }
// //     } else {
// //       return Left(
// //           Failure(FALSE as int, ResponseMessage.NO_INTERNET_CONNECTION));
// //     }
// //   }

// // //  Order Group Filter

// //   @override
// //   Future<loginResponse.Either<Failure, OrderGroupFilterModel>>
// //       getOrderGroupFilter(
// //           OrderGroupFilterRequest orderGroupFilterRequest) async {
// //     try {
// //       final response = await _remoteDataSource.getOrderGroupFilter(
// //         OrderGroupFilterRequest(
// //             orderGroupFilterRequest.itemType,
// //             orderGroupFilterRequest.weight,
// //             orderGroupFilterRequest.urgency,
// //             orderGroupFilterRequest.destination,
// //             orderGroupFilterRequest.origin,
// //             orderGroupFilterRequest.page,
// //             orderGroupFilterRequest.limit),
// //       );
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         return Right(response.toDomain());
// //       } else if (response.statusCode == 404) {
// //         return Left(Failure((FALSE) as int, ResponseMessage.NOTFOUND));
// //       } else {
// //         return Left(Failure((FALSE) as int, ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// // // Get Carrier
// //   @override
// //   Future<loginResponse.Either<Failure, GetCarriersModel>> getCarriers(
// //       GetCarrierRequest getCarrierRequest) async {
// //     try {
// //       final response = await _remoteDataSource.getCarriers(GetCarrierRequest(
// //         getCarrierRequest.sourceOrdestination1,
// //         getCarrierRequest.sourceOrdestination2,
// //         getCarrierRequest.page,
// //         getCarrierRequest.limit,
// //       ));
// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         return Right(response.toDomain());
// //       } else if (response.statusCode == 404) {
// //         return Left(Failure((FALSE) as int, ResponseMessage.NOTFOUND));
// //       } else {
// //         return Left(Failure((FALSE) as int, ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// // // Get Order Group
// //   @override
// //   Future<loginResponse.Either<Failure, GetOrderGroupResponseModel>>
// //       getOrderGroup() async {
// //     try {
// //       final response = await _remoteDataSource.getOrderGroup();

// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         return Right(response.toDomain());
// //       } else if (response.statusCode == 404) {
// //         return Left(Failure((FALSE) as int, ResponseMessage.NOTFOUND));
// //       } else {
// //         return Left(Failure((FALSE) as int, ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// // // Delete Endpoints
// //   @override
// //   Future<Either<Failure, OrderGroupDeleteResponseModel>> deleteOrderGroup(
// //       DeleteOrderGroupRequest deleteOrderGroupRequest) async {
// //     try {
// //       final response =
// //           await _remoteDataSource.deleteOrderGroup(deleteOrderGroupRequest);

// //       if (response.statusCode == 200 || response.statusCode == 201) {
// //         return Right(response.toDomain());
// //       } else if (response.statusCode == 404) {
// //         return Left(Failure((FALSE) as int, ResponseMessage.NOTFOUND));
// //       } else {
// //         return Left(Failure((FALSE) as int, ResponseMessage.DEFAULT));
// //       }
// //     } catch (error) {
// //       return (Left(ErrorHandler.handle(error).failure));
// //     }
// //   }

// //   @override
// //   Future<Either<Failure, Categories>> getCategories() {
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<Either<Failure, Resources>> getInstructorResources() {
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<Either<Failure, Resources>> getResources() {
// //     throw UnimplementedError();
// //   }

// //   @override
// //   Future<Either<Failure, Resources>> getUserResources() {
// //     throw UnimplementedError();
// //   }
// }
