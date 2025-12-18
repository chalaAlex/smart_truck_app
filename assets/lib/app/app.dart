// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MyApp extends StatefulWidget {
//   factory MyApp() => instance; //factory for the class instance

//   MyApp._internal(); //private named constructor

//   static final MyApp instance =
//       MyApp._internal(); //single instance -- singleton

//   int appState = 0;

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   // ThemeData initTheme = Themes.lightTheme;

//   @override
//   void initState() {
//     super.initState();
//     // _loadTheme();
//   }

//   // Future<void> _loadTheme() async {
//   //   final themeMode = await instance<AppPreferences>().getThemeMode();
//   //   setState(() {
//   //     initTheme = (themeMode == 'dark') ? Themes.darkTheme : Themes.lightTheme;
//   //   });

//   //   // For debugging
//   //   (themeMode);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         // BlocProvider<CategoriesBloc>(
//         //   create: (context) => instance<CategoriesBloc>(),
//         // ),
        
//       ],
//       child: MaterialApp(
//         // onGenerateRoute: RouteGenerator.getRoute,
//         debugShowCheckedModeBanner: false,
//         // theme: Themes.lightTheme,
//         home: const Scaffold(
//           body: Placeholder(),
//         ),
//       ),
//     );
//   }
// }
