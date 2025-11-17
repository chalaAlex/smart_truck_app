import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AfanOromoLocalizations extends MaterialLocalizations {
  AfanOromoLocalizations();

  @override
  String get okButtonLabel => 'Eeyyee';

  @override
  String aboutListTileTitle(String applicationName) {
    return '$applicationName irratti';
  }

  @override
  String get alertDialogLabel => 'Akeekkachiisa';

  @override
  String get anteMeridiemAbbreviation => 'WD'; // Walakkaa Duraa (AM)

  @override
  String get backButtonTooltip => 'Deebi\'i';

  @override
  String get bottomSheetLabel => 'Bitaa';

  @override
  String get calendarModeButtonLabel => 'Kaleendara';

  @override
  String get cancelButtonLabel => 'Haquu';

  @override
  String get closeButtonLabel => 'Cufi';

  @override
  String get closeButtonTooltip => 'Cufi';

  @override
  String get continueButtonLabel => 'Itti fufi';

  @override
  String get copyButtonLabel => 'Fakkeessi';

  @override
  String get currentDateLabel => 'Guyyaa har\'a';

  @override
  String get cutButtonLabel => 'Muruu';

  @override
  String get dateHelpText => 'Guyyaa Galchi';

  @override
  String get dateInputLabel => 'Guyyaa';

  @override
  String get dateOutOfRangeLabel => 'Al-Mara';

  @override
  String get datePickerHelpText => 'Guyyaa filadhu';

  @override
  String dateRangeEndDateSemanticLabel(String formattedDate) {
    return 'Guyyaa xumuraa $formattedDate';
  }

  @override
  String get dateRangeEndLabel => 'Guyyaa Xumuraa';

  @override
  String get dateRangePickerHelpText => 'Bifa walfakkaatu filadhu';

  @override
  String dateRangeStartDateSemanticLabel(String formattedDate) {
    return 'Guyyaa jalqaba $formattedDate';
  }

  @override
  String get dateRangeStartLabel => 'Guyyaa Jalqabaa';

  @override
  String get dateSeparator => '/';

  @override
  String get deleteButtonTooltip => 'Haquu';

  @override
  String get dialModeButtonLabel => 'Madaaluu';

  @override
  String get dialogLabel => 'Hiikoo';

  @override
  String get drawerLabel => 'Furdaa';

  @override
  int get firstDayOfWeekIndex => 1; // 1=Monday

  @override
  String get firstPageTooltip => 'Fuula jalqabaa';

  @override
  String formatCompactDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  String formatDecimal(int number) {
    return '$number';
  }

  @override
  String formatFullDate(DateTime date) {
    return '${date.day} ${date.month}, ${date.year}';
  }

  @override
  String formatHour(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    return '${timeOfDay.hour}';
  }

  @override
  String formatMediumDate(DateTime date) {
    return '${date.day} ${date.month}, ${date.year}';
  }

  @override
  String formatMinute(TimeOfDay timeOfDay) {
    return '${timeOfDay.minute}';
  }

  @override
  String formatMonthYear(DateTime date) {
    return '${date.month}/${date.year}';
  }

  @override
  String formatShortDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  String formatShortMonthDay(DateTime date) {
    return '${date.day}/${date.month}';
  }

  @override
  String formatTimeOfDay(TimeOfDay timeOfDay, {bool alwaysUse24HourFormat = false}) {
    return '${timeOfDay.hour}:${timeOfDay.minute}';
  }

  @override
  String formatYear(DateTime date) {
    return '${date.year}';
  }

  @override
  String get hideAccountsLabel => 'Herrega dhoksuu';

  @override
  String get inputDateModeButtonLabel => 'Yeroo galchi';

  @override
  String get inputTimeModeButtonLabel => 'Yeroo galchi';

  @override
  String get invalidDateFormatLabel => 'Guyyaa sirrii miti';

  @override
  String get invalidDateRangeLabel => 'Daateen sirrii miti';

  @override
  String get invalidTimeLabel => 'Yeroo sirrii miti';

  @override
  String get keyboardKeyAlt => 'Alt';

  @override
  String get keyboardKeyAltGraph => 'AltGr';

  @override
  String get keyboardKeyBackspace => 'Boodarra';

  @override
  String get keyboardKeyCapsLock => 'Kaappii';

  @override
  String get keyboardKeyChannelDown => 'Kaanaalii gadi bu\'i';

  @override
  String get keyboardKeyChannelUp => 'Kaanaalii olkaasi';

  @override
  String get keyboardKeyControl => 'Kantoroolii';

  @override
  String get keyboardKeyDelete => 'Haquu';

  @override
  String get keyboardKeyEject => 'Bayisi';

  @override
  String get keyboardKeyEnd => 'Xumura';

  @override
  String get keyboardKeyEscape => 'Bayi';

  @override
  String get keyboardKeyFn => 'FN';

  @override
  String get keyboardKeyHome => 'Mana';

  @override
  String get keyboardKeyInsert => 'Galchi';

  @override
  String get keyboardKeyMeta => 'Meettaa';

  @override
  String get keyboardKeyMetaMacOs => 'Meettaa';

  @override
  String get keyboardKeyMetaWindows => 'Meettaa';

  @override
  String get keyboardKeyNumLock => 'Lakkoofsaa cufaa';

  @override
  String get keyboardKeyNumpad0 => '0';

  @override
  String get keyboardKeyNumpad1 => '1';

  @override
  String get keyboardKeyNumpad2 => '2';

  @override
  String get keyboardKeyNumpad3 => '3';

  @override
  String get keyboardKeyNumpad4 => '4';

  @override
  String get keyboardKeyNumpad5 => '5';

  @override
  String get keyboardKeyNumpad6 => '6';

  @override
  String get keyboardKeyNumpad7 => '7';

  @override
  String get keyboardKeyNumpad8 => '8';

  @override
  String get keyboardKeyNumpad9 => '9';

  @override
  String get keyboardKeyNumpadAdd => 'Itticha';

  @override
  String get keyboardKeyNumpadComma => ',';

  @override
  String get keyboardKeyNumpadDecimal => '.';

  @override
  String get keyboardKeyNumpadDivide => 'Qoodaa';

  @override
  String get keyboardKeyNumpadEnter => 'Galchi';

  @override
  String get keyboardKeyNumpadEqual => '=';

  @override
  String get keyboardKeyNumpadMultiply => 'Baay\'isi';

  @override
  String get keyboardKeyNumpadParenLeft => '(';

  @override
  String get keyboardKeyNumpadParenRight => ')';

  @override
  String get keyboardKeyNumpadSubtract => 'Gadi bu\'i';

  @override
  String get keyboardKeyPageDown => 'Fuula gadi bu\'i';

  @override
  String get keyboardKeyPageUp => 'Fuula olkaasi';

  @override
  String get keyboardKeyPower => 'Humna';

  @override
  String get keyboardKeyPowerOff => 'Humna cufuu';

  @override
  String get keyboardKeyScreen => 'Fuula maxxansi';

  @override
  String get keyboardKeyScrollLock => 'Dabalataan roga';

  @override
  String get keyboardKeySelect => 'Filadhu';

  @override
  String get keyboardKeyShift => 'Bira kuta';

  @override
  String get keyboardKeySpace => 'Qubee';

  @override
  String get lastPageTooltip => 'Fuula dhumaa';

  @override
  String licensesPackageDetailText(int licenseCount) {
    return '$licenseCount seerota';
  }

  @override
  String get licensesPageTitle => 'Fuula seerotaa';

  @override
  String get lookUpButtonLabel => 'Barbaadi';

  @override
  String get menuBarMenuLabel => 'Meeniyuu';

  @override
  String get menuDismissLabel => 'Cufi';

  @override
  String get modalBarrierDismissLabel => 'Cufi';

  @override
  String get moreButtonTooltip => 'Gadi fagee';

  @override
  List<String> get narrowWeekdays => ['Du', 'W', 'Ra', 'Ki', 'Ka', 'G', 'Sb'];

  @override
  String get nextMonthTooltip => 'Ji\'a itti aanu';

  @override
  String get nextPageTooltip => 'Fuula itti aanu';

  @override
  String get okButtonTooltip => 'Eeyyee';

  @override
  String get openAppDrawerTooltip => 'Meeniyuu cufi';

  @override
  String get pageRowsInfoTitleApproximate => 'firstRow-lastRow/ rowCount bifa';

  @override
  String get pasteButtonLabel => 'Buusi';

  @override
  String get popupMenuLabel => 'Meeniyuu';

  @override
  String get previousMonthTooltip => 'Ji\'a darbe';

  @override
  String get previousPageTooltip => 'Fuula darbe';

  @override
  String get refreshIndicatorSemanticLabel => 'Furdaa haaromsi';

  @override
  String get remainingTextFieldCharacterCountOne => 'Batteessa tokko';

  @override
  String get remainingTextFieldCharacterCountOther => 'Batteessa hafe';

  @override
  String get remainingTextFieldCharacterCountZero => 'Batteessa hafe hin jiru';

  @override
  String get reorderItemDown => 'Item gadi buusi';

  @override
  String get reorderItemLeft => 'Item bitaa buusi';

  @override
  String get reorderItemRight => 'Item mirga buusi';

  @override
  String get reorderItemToEnd => 'Item dhumarratti jijjiiri';

  @override
  String get reorderItemToStart => 'Item jalqabarratti jijjiiri';

  @override
  String get reorderItemUp => 'Item olkaasi';

  @override
  String get rowsPerPageTitle => 'Tarree fuulaa';

  @override
  String get saveButtonLabel => 'Kuusi';

  @override
  String get searchFieldLabel => 'Barbaadi';

  @override
  String get selectAllButtonLabel => 'Hundaa filadhu';

  @override
  String get selectYear => 'Bara filadhu';

  @override
  String get selectedRowCountTitleFew => 'xiqqo fili fili';

  @override
  String get selectedRowCountTitleMany => 'baayyee  fili';

  @override
  String get selectedRowCountTitleOne => 'tokko fili';

  @override
  String get selectedRowCountTitleOther => 'kan biroo fili';

  @override
  String get selectedRowCountTitleZero => 'Waan fili hin jiru';

  @override
  String get showAccountsLabel => 'Herrega agarsiisi';

  @override
  String get showMenuTooltip => 'Meeniyuu agarsiisi';

  @override
  String get signedInLabel => 'Galmaahi';

 

  @override
  String get textInputActionContinue => 'Itti fufi';

  @override
  String get textInputActionDone => 'Galchi';

  @override
  String get textInputActionGo => 'Eegali';

  @override
  String get textInputActionJoin => 'Waliigali';

  @override
  String get textInputActionNext => 'Itti aanu';

  @override
  String get textInputActionPrevious => 'Kan duraa';

  @override
  String get textInputActionRoute => 'Daandii';

  @override
  String get textInputActionSearch => 'Barbaadi';

  @override
  String get textInputActionSend => 'Ergi';

  @override
  String get textInputActionUnspecified => 'Akaakuu tokko miti';

  @override
  String get timePickerHourLabel => 'Sa\'aatii';

  @override
  String get timePickerMinuteLabel => 'Daqiiqaa';

  @override
  String get timePickerSecondLabel => 'Sekondii';

  @override
  String get timePickerDialHelpText => 'Sa\'aatii filadhu';

  @override
  String get timePickerHourModeAnnouncement => 'Sa\'aatii filadhu';

  @override
  String get timePickerInputHelpText => 'Sa\'aatii galchi';

  @override
  String get timePickerMinuteModeAnnouncement => 'Daqiiqaa filadhu';

  @override
  String get unspecifiedDateLabel => 'Guyyaa hin beekamne';

  @override
  String get viewLicensesButtonLabel => 'Seerota ilaali';

  @override
  String get yearPickerDescription => 'Bara filadhu';

  @override
  String get licensesPageDescription => 'Seerota ilaali';
  
   @override
  String get searchWebButtonLabel => 'Search the web';

  @override
  String get selectYearSemanticsLabel => 'Select year';

  @override
  String selectedRowCountTitle(int selectedRowCount) {
    return '$selectedRowCount selected';
  }

  @override
  String get shareButtonLabel => 'Share';

  @override
  String tabLabel({required int tabIndex, required int tabCount}) {
    return 'Tab $tabIndex of $tabCount';
  }

  @override
  TimeOfDayFormat timeOfDayFormat({bool alwaysUse24HourFormat = false}) {
    return alwaysUse24HourFormat ? TimeOfDayFormat.HH_colon_mm : TimeOfDayFormat.HH_dot_mm;
  }

  @override
  String get unspecifiedDate => 'Date';

  @override
  String get unspecifiedDateRange => 'Date range';

  @override
  String pageRowsInfoTitle(int firstRow, int lastRow, int rowCount, bool rowCountIsApproximate) {
    return 'Showing rows ${firstRow + 1} to $lastRow of about $rowCount';
  }
  
 @override
  DateTime? parseCompactDate(String? inputString) {
    if (inputString == null) return null;
    try {
      final format = DateFormat.yMd();
      return format.parse(inputString);
    } catch (_) {
      return null;
    }
  }

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String remainingTextFieldCharacterCount(int remaining) {
    return 'Characters remaining: $remaining';
  }

  @override
  String get scanTextButtonLabel => 'Scan';

  @override
  String get scrimLabel => 'Dismiss';

  @override
  String scrimOnTapHint(String modalRouteContentName) {
    return 'Tap to dismiss $modalRouteContentName';
  }
  
  @override
  // TODO: implement scriptCategory
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;
  
  @override
  // TODO: implement clearButtonTooltip
  String get clearButtonTooltip => throw UnimplementedError();
  
  @override
  // TODO: implement selectedDateLabel
  String get selectedDateLabel => throw UnimplementedError();
  
  @override
  // TODO: implement keyboardKeyPrintScreen
  String get keyboardKeyPrintScreen => throw UnimplementedError();
}
