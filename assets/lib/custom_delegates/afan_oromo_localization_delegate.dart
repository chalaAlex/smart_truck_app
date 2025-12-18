// import 'dart:ui';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_logistics/custom_delegates/afan_oromo_material_localization.dart';

// class AfanOromoLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
//   const AfanOromoLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) {
//     return locale == const Locale('om');
//   }

//   @override
//   Future<MaterialLocalizations> load(Locale locale) {
//     assert(locale == const Locale('om'));
//     return SynchronousFuture<MaterialLocalizations>(AfanOromoLocalizations());
//   }

//   @override
//   bool shouldReload(AfanOromoLocalizationsDelegate old) => false;
// }