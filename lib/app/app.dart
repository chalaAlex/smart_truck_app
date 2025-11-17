import 'package:easy_logistics/app/app_preferences.dart';
import 'package:easy_logistics/app/di.dart';
import 'package:easy_logistics/presentation/bloc/assign_carrier/assign_carrier_bloc.dart';
import 'package:easy_logistics/presentation/bloc/assign_order/assign_order_bloc.dart';
import 'package:easy_logistics/presentation/bloc/auth/login/login_bloc.dart';
import 'package:easy_logistics/presentation/bloc/categories/category_bloc.dart';
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
import 'package:easy_logistics/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_logistics/presentation/bloc/resources/instructor/instructor_resources_bloc.dart';
import 'package:easy_logistics/presentation/bloc/resources/resources_bloc.dart';
import 'package:easy_logistics/presentation/bloc/resources/user/user_resources_bloc.dart';
import 'package:easy_logistics/presentation/resources/routes_manager.dart';
import 'package:easy_logistics/presentation/resources/theme_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  factory MyApp() => instance; //factory for the class instance

  MyApp._internal(); //private named constructor

  static final MyApp instance =
      MyApp._internal(); //single instance -- singleton

  int appState = 0;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData initTheme = Themes.lightTheme;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final themeMode = await instance<AppPreferences>().getThemeMode();
    setState(() {
      initTheme = (themeMode == 'dark') ? Themes.darkTheme : Themes.lightTheme;
    });

    // For debugging
    (themeMode);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesBloc>(
          create: (context) => instance<CategoriesBloc>(),
        ),
        BlocProvider<ResourcesBloc>(
          create: (context) => instance<ResourcesBloc>(),
        ),
        BlocProvider<UserResourcesBloc>(
          create: (context) => instance<UserResourcesBloc>(),
        ),
        BlocProvider<InstructorResourcesBloc>(
          create: (context) => instance<InstructorResourcesBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => instance<LoginBloc>(),
        ),
        BlocProvider<GetOrdersBloc>(
          create: (context) => instance<GetOrdersBloc>(),
        ),
        BlocProvider<ChangePasswordBloc>(
          create: (context) => instance<ChangePasswordBloc>(),
        ),
        BlocProvider<CreateOrderBloc>(
          create: (context) => instance<CreateOrderBloc>(),
        ),
        BlocProvider<LocationBloc>(
          create: (context) => instance<LocationBloc>(),
        ),
        BlocProvider<OtpRequestBloc>(
          create: (context) => instance<OtpRequestBloc>(),
        ),
        BlocProvider<VerifyOtpBloc>(
          create: (context) => instance<VerifyOtpBloc>(),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => instance<ResetPasswordBloc>(),
        ),
        BlocProvider<UpdateProfileBloc>(
          create: (context) => instance<UpdateProfileBloc>(),
        ),
        BlocProvider<OrderFilterBloc>(
          create: (context) => instance<OrderFilterBloc>(),
        ),
        BlocProvider<CreateOrderGroupBloc>(
          create: (context) => instance<CreateOrderGroupBloc>(),
        ),
        BlocProvider<GetOrderGroupBloc>(
          create: (context) => instance<GetOrderGroupBloc>(),
        ),
        BlocProvider<OrderGroupDeleteBloc>(
          create: (context) => instance<OrderGroupDeleteBloc>(),
        ),
        BlocProvider<GetCarrierBloc>(
          create: (context) => instance<GetCarrierBloc>(),
        ),
        BlocProvider<AssignCarrierBloc>(
          create: (context) => instance<AssignCarrierBloc>(),
        ),
        BlocProvider<OrderGroupFilterBloc>(
          create: (context) => instance<OrderGroupFilterBloc>(),
        ),
        BlocProvider<AssignOrderBloc>(
          create: (context) => instance<AssignOrderBloc>(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.getRoute,
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        home: const Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
