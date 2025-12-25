import 'package:flutter/material.dart';
import 'package:smart_truck_app/core/app/app_preferences.dart';
import 'package:smart_truck_app/core/app/di.dart';
import 'package:smart_truck_app/features/registration/presentation/pages/onboarding/role_selection.dart';
import 'package:smart_truck_app/core/resources/route_manager.dart';
import 'package:smart_truck_app/utils/theme.dart';

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
  ThemeData initTheme = TAppTheme.lightTheme;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final themeMode = await instance<AppPreferences>().getThemeMode();
    setState(() {
      initTheme = (themeMode == 'dark')
          ? TAppTheme.darkTheme
          : TAppTheme.lightTheme;
    });

    // For debugging
    (themeMode);
  }

  @override
  Widget build(BuildContext context) {
    return 
    // MultiBlocProvider(
    //   providers: [
    //     // BlocProvider<CategoriesBloc>(
    //     //   create: (context) => instance<CategoriesBloc>(),
    //     // ),
    //   ],
       MaterialApp(
        // themeMode: ThemeMode.system, // TODO 1. 
        onGenerateRoute: RouteGenerator.getRoute,
        debugShowCheckedModeBanner: false,
        theme: TAppTheme.lightTheme,
        // darkTheme: TAppTheme.darkTheme,
        home: RoleSelectionScreen(),
        // home: ReviewPage(),
      );
  }
}
