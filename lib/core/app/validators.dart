class InputValidators { 
  static String orderNameValidator(String? input) { 
    if(input!.isEmpty) { 
      return "Order name cannot be empty";
    }
    return "";
  }
}