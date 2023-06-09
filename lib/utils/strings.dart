class AppString {
  // Login and SignUp
  static const String passwordIsEmptyValidation = "Enter the Password";
  static const String passwordValidation =
      "Password must contain UpperCase, LowerCase, Number and special character.";
  static const String passwordLengthValidation = "Enter 8 digit Password";
  static const String passwordSameValidation = "Confirm Password does't match";
  static const String currentUserPref = "saveUserPref";
}

class ApiURL {
  static const String logIn = "https://fakestoreapi.com/auth/login";
  static const String signUp = "https://fakestoreapi.com/users";
  static const String productsURL = "https://fakestoreapi.com/products";
}
