enum LanguageType { ENGLISH, AMHARIC }

const String ENGLISH = "en";
const String AMHARIC = "am";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.AMHARIC:
        return AMHARIC;
    }
  }
}
