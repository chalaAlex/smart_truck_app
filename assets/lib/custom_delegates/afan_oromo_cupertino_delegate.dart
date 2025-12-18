// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';

// class AfanOromoCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
//   const AfanOromoCupertinoLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) {
//     return locale == const Locale('om');
//   }

//   @override
//   Future<CupertinoLocalizations> load(Locale locale) {
//     assert(locale == const Locale('om'));
//     return SynchronousFuture<CupertinoLocalizations>(AfanOromoCupertinoLocalizations());
//   }

//   @override
//   bool shouldReload(AfanOromoCupertinoLocalizationsDelegate old) => false;
// }

// class AfanOromoCupertinoLocalizations extends CupertinoLocalizations {
//   @override
//   String get alertDialogLabel => 'Dubbisaa fudhatamaa';

//   @override
//   String get anteMeridiemAbbreviation => 'WA'; // Adjust based on Oromo time conventions

//   @override
//   String get clearButtonLabel => 'Dabaasu';

//   @override
//   String get copyButtonLabel => 'Kopii godhi';

//   @override
//   String get cutButtonLabel => 'Cidhu';

//   @override
//   DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.ymd; // Adjust based on Oromo date format

//   @override
//   DatePickerDateTimeOrder get datePickerDateTimeOrder => DatePickerDateTimeOrder.date_dayPeriod_time; // Adjust based on Oromo date and time format

//   @override
//   String datePickerDayOfMonth(int dayIndex, [int? weekDay]) {
//     // Implement based on Oromo date format
//     return '$dayIndex'; // Placeholder
//   }

//   @override
//   String datePickerHour(int hour) {
//     return '$hour'; // Placeholder
//   }

//   @override
//   String? datePickerHourSemanticsLabel(int hour) {
//     return '$hour saati'; // Placeholder
//   }

//   @override
//   String datePickerMediumDate(DateTime date) {
//     // Implement based on Oromo date format
//     return '${date.day} ${datePickerMonth(date.month - 1)}, ${date.year}'; // Placeholder
//   }

//   @override
//   String datePickerMinute(int minute) {
//     return '$minute'; // Placeholder
//   }

//   @override
//   String? datePickerMinuteSemanticsLabel(int minute) {
//     return '$minute daqiiqaa'; // Placeholder
//   }

//   @override
//   String datePickerMonth(int monthIndex) {
//     // Implement based on Oromo month names
//     final months = ['Fulbani', 'Bitoteessa', 'Martii', 'Apreco', 'Caamsaa', 'Waxabajjii', 'Adaa', 'Hagayya', 'Asenyaa', 'Sittafa', 'Ogbaa', 'Mudhamee'];
//     return months[monthIndex];
//   }

//   @override
//   String datePickerStandaloneMonth(int monthIndex) {
//     // Implement based on Oromo month names
//     return datePickerMonth(monthIndex); // Placeholder
//   }

//   @override
//   String datePickerYear(int yearIndex) {
//     return '$yearIndex'; // Placeholder
//   }

//   @override
//   String get lookUpButtonLabel => 'Barbaadda';

//   @override
//   String get menuDismissLabel => 'Cufi';

//   @override
//   String get modalBarrierDismissLabel => 'Cufi';

//   @override
//   String get noSpellCheckReplacementsLabel => 'Yaada sirreessaa hin beeksifamu';

//   @override
//   String get pasteButtonLabel => 'Paasiti';

//   @override
//   String get postMeridiemAbbreviation => 'FP'; // Adjust based on Oromo time conventions

//   @override
//   String get searchTextFieldPlaceholderLabel => 'Barreessi';

//   @override
//   String get searchWebButtonLabel => 'Intarneeta irratti barbaadhu';

//   @override
//   String get selectAllButtonLabel => 'Hunduma filata';

//   @override
//   String get shareButtonLabel => 'Qoqqobsaa';

//   @override
//   String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
//     return 'Tab $tabIndex of $tabCount'; // Placeholder
//   }

//   @override
//   String timerPickerHour(int hour) {
//     return '$hour'; // Placeholder
//   }

//   @override
//   String? timerPickerHourLabel(int hour) {
//     return '$hour sa\'ati'; // Placeholder
//   }

//   @override
//   List<String> get timerPickerHourLabels => List.generate(24, (index) => '$index'); // Placeholder

//   @override
//   String timerPickerMinute(int minute) {
//     return '$minute'; // Placeholder
//   }

//   @override
//   String? timerPickerMinuteLabel(int minute) {
//     return '$minute daqiiqaa'; // Placeholder
//   }

//   @override
//   List<String> get timerPickerMinuteLabels => List.generate(60, (index) => '$index'); // Placeholder

//   @override
//   String timerPickerSecond(int second) {
//     return '$second'; // Placeholder
//   }

//   @override
//   String? timerPickerSecondLabel(int second) {
//     return '$second sekondi'; // Placeholder
//   }

//   @override
//   List<String> get timerPickerSecondLabels => List.generate(60, (index) => '$index'); // Placeholder

//   @override
//   String get todayLabel => 'Har\'a';
// }