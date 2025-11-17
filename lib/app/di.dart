import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:easy_logistics/domain/usecase/assign_order_group_usecase.dart';
import 'package:easy_logistics/domain/usecase/assign_order_usecase.dart';
import 'package:easy_logistics/domain/usecase/changePassword_usecase.dart';
import 'package:easy_logistics/domain/usecase/create_order_group_use_case.dart';
import 'package:easy_logistics/domain/usecase/create_order_usecase.dart';
import 'package:easy_logistics/domain/usecase/delete_order_group_usecase.dart';
import 'package:easy_logistics/domain/usecase/get_carrier_usecase.dart';
import 'package:easy_logistics/domain/usecase/get_order_group_usecase.dart';
import 'package:easy_logistics/domain/usecase/getLocationUseCase.dart';
import 'package:easy_logistics/domain/usecase/getOrdersUsecase.dart';
import 'package:easy_logistics/domain/usecase/orderFilterUsecase.dart';
import 'package:easy_logistics/domain/usecase/orderGroupFilterUseCase.dart';
import 'package:easy_logistics/domain/usecase/otp_request_usecase.dart';
import 'package:easy_logistics/domain/usecase/reset_password_usec_case.dart';
import 'package:easy_logistics/domain/usecase/updateProfileUseCase.dart';
import 'package:easy_logistics/domain/usecase/verify_otp_usecase.dart';
import 'package:easy_logistics/presentation/bloc/assign_carrier/assign_carrier_bloc.dart';
import 'package:easy_logistics/presentation/bloc/assign_order/assign_order_bloc.dart';
import 'package:easy_logistics/presentation/bloc/change_password/change_password_bloc.dart';
import 'package:easy_logistics/presentation/bloc/create_orders/create_orders_bloc.dart';
import 'package:easy_logistics/presentation/bloc/delete_order/order_group_delete_bloc.dart';
import 'package:easy_logistics/presentation/bloc/get_carriers/get_carrier_bloc.dart';
import 'package:easy_logistics/presentation/bloc/location/getLocationBloc.dart';
import 'package:easy_logistics/presentation/bloc/orderGroup/create_order_group_bloc.dart';
import 'package:easy_logistics/presentation/bloc/order_filter/order_filter_bloc.dart';
import 'package:easy_logistics/presentation/bloc/order_group/get_order_group_bloc.dart';
import 'package:easy_logistics/presentation/bloc/order_group_filter/order_group_filter_bloc.dart';
import 'package:easy_logistics/presentation/bloc/orders/get_orders_bloc.dart';
import 'package:easy_logistics/presentation/bloc/otp_request/otp_request_bloc.dart';
import 'package:easy_logistics/presentation/bloc/reset_password/set_new_password_bloc.dart';
import 'package:easy_logistics/presentation/bloc/updateProfile/update_profile_bloc.dart';
import 'package:easy_logistics/presentation/bloc/verify_otp/verify_otp_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_logistics/app/app_preferences.dart';
import 'package:easy_logistics/app/constant.dart';
import 'package:easy_logistics/data/data_source/local_data_source.dart';
import 'package:easy_logistics/data/data_source/remote_data_source.dart';
import 'package:easy_logistics/data/network/app_api.dart';
import 'package:easy_logistics/data/network/dio_factory.dart';
import 'package:easy_logistics/data/network/network_info.dart';
import 'package:easy_logistics/data/repository/repository_implementor.dart';
import 'package:easy_logistics/domain/repository/repository.dart';
import 'package:easy_logistics/domain/usecase/getCategories_usecase.dart';
import 'package:easy_logistics/domain/usecase/getResources_usecase.dart';
import 'package:easy_logistics/domain/usecase/getUserResources_usecase.dart';
import 'package:easy_logistics/domain/usecase/login_usecase.dart';
import 'package:easy_logistics/presentation/bloc/auth/login/login_bloc.dart';
import 'package:easy_logistics/presentation/bloc/categories/category_bloc.dart';
import 'package:easy_logistics/presentation/bloc/resources/resources_bloc.dart';
import 'package:easy_logistics/presentation/bloc/resources/user/user_resources_bloc.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  await Constant.loadToken();

  // shared refs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementor(DataConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementor(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpelementor(instance(), instance(), instance(), instance()));

  // local data source
  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImplementor());

  // get PropertyUsecase

  // auth
  instance.registerLazySingleton<LoginUseCase>(() => LoginUseCase(instance()));
  instance.registerLazySingleton<LoginBloc>(() => LoginBloc(instance(), instance()));

  // otp request
  instance.registerLazySingleton<OtpRequestUsecase>(() => OtpRequestUsecase(instance()));
  instance.registerLazySingleton<OtpRequestBloc>(() => OtpRequestBloc(instance()));

  // set new password
  instance.registerLazySingleton<ResetPasswordUseCase>(() => ResetPasswordUseCase(instance()));
  instance.registerLazySingleton<ResetPasswordBloc>(() => ResetPasswordBloc(instance()));

   // Change password
  instance.registerLazySingleton<ChangepasswordUsecase>(() => ChangepasswordUsecase(instance()));
  instance.registerLazySingleton<ChangePasswordBloc>(() => ChangePasswordBloc(instance()));

  instance.registerLazySingleton<UpdateProfileUseCase>(() => UpdateProfileUseCase(instance()));
  instance.registerLazySingleton<UpdateProfileBloc>(() => UpdateProfileBloc(instance()));
 
  // Verify OTP 
  instance.registerLazySingleton<VerifyOtpUsecase>(() => VerifyOtpUsecase(instance()));
  instance.registerLazySingleton<CreateOrderGroupBloc>(() => CreateOrderGroupBloc(instance()));

  // Create Order Group
  instance.registerLazySingleton<CreateOrderGroupUseCase>(() => CreateOrderGroupUseCase(instance()));
  instance.registerLazySingleton<VerifyOtpBloc>(() => VerifyOtpBloc(instance()));

  //orders
  instance.registerLazySingleton<GetOrdersUseCase>(() => GetOrdersUseCase(instance()));
  instance.registerLazySingleton<LocationBloc>(() => LocationBloc(instance()));

  // get location
  instance.registerLazySingleton<GetlocationUsecase>(() => GetlocationUsecase(instance()));
  instance.registerLazySingleton<GetOrdersBloc>(() => GetOrdersBloc(instance()));
  // order filter
  instance.registerLazySingleton<GetOrderFilterUseCase>(() => GetOrderFilterUseCase(instance()));
  instance.registerLazySingleton<OrderFilterBloc>(() => OrderFilterBloc(instance()));

  // create order
  instance.registerLazySingleton<CreateOrderUsecase>(() => CreateOrderUsecase(instance()));
  instance.registerLazySingleton<CreateOrderBloc>(() => CreateOrderBloc(instance()));

  // get order group
  instance.registerLazySingleton<GetOrderGroupUseCase>(() => GetOrderGroupUseCase(instance()));
  instance.registerLazySingleton<GetOrderGroupBloc>(() => GetOrderGroupBloc(instance()));

  // order group filter
  instance.registerLazySingleton<OrderGroupFilterUseCase>(() => OrderGroupFilterUseCase(instance()));
  instance.registerLazySingleton<OrderGroupFilterBloc>(() => OrderGroupFilterBloc(instance()));

  // get order group
  instance.registerLazySingleton<DeleteOrderGroupUseCase>(() => DeleteOrderGroupUseCase(instance()));
  instance.registerLazySingleton<OrderGroupDeleteBloc>(() => OrderGroupDeleteBloc(instance()));

  // get order group
  instance.registerLazySingleton<GetCarrierUseCase>(() => GetCarrierUseCase(instance()));
  instance.registerLazySingleton<GetCarrierBloc>(() => GetCarrierBloc(instance()));

  // Assing Carrier
  instance.registerLazySingleton<AssignOrderGroupUsecase>(() => AssignOrderGroupUsecase(instance()));
  instance.registerLazySingleton<AssignCarrierBloc>(() => AssignCarrierBloc(instance()));

  // Assign order
  instance.registerLazySingleton<AssignOrderUsecase>(() => AssignOrderUsecase(instance()));
  instance.registerLazySingleton<AssignOrderBloc>(() => AssignOrderBloc(instance()));

  // getCategories
  instance.registerLazySingleton<GetCategoriesUseCase>(() => GetCategoriesUseCase(instance()));
  instance
      .registerLazySingleton<CategoriesBloc>(() => CategoriesBloc(instance()));
  instance.registerFactory<GetResourcesUseCase>(
      () => GetResourcesUseCase(instance()));
  instance.registerFactory<ResourcesBloc>(() => ResourcesBloc(instance()));
  instance.registerFactory<GetUserResourcesUseCase>(
      () => GetUserResourcesUseCase(instance()));
  instance
      .registerFactory<UserResourcesBloc>(() => UserResourcesBloc(instance()));

  // instance.registerFactory<GetInstructorResourcesUseCase>(
  //     () => GetInstructorResourcesUseCase(instance()));

  // instance.registerFactory<InstructorResourcesBloc>(
  //     () => InstructorResourcesBloc(instance()));

  //     instance.registerFactory<GetMyPropertiesUseCase>(
  //   () => GetMyPropertiesUseCase(instance()));

  //  instance.registerFactory<MyPropertiesBloc>(
  //   () => MyPropertiesBloc(instance()));
}
 
// initLoginModule() {
//   if (!GetIt.I.isRegistered<LoginUseCase>()) {
//     instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
//     instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
//   }
// }

// initForgetPasswordModule() {
//   if (!GetIt.I.isRegistered<ForgetPasswordUseCase>()) {
//     instance.registerFactory<ForgetPasswordUseCase>(
//         () => ForgetPasswordUseCase(instance()));
//     instance.registerFactory<ForgetPasswordViewModel>(
//         () => ForgetPasswordViewModel(instance()));
//   }
// }

// initRegisterModule() {
//   if (!GetIt.I.isRegistered<RegisterUseCase>()) {
//     instance
//         .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
//     instance.registerFactory<RegisterViewModel>(
//         () => RegisterViewModel(instance()));
//     instance.registerFactory<ImagePicker>(() => ImagePicker());
//   }
// }

