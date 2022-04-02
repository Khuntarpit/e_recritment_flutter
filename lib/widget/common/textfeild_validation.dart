class TextFieldValidation {
  TextFieldValidation._();
  static String validation({
    String value,
    String message,
    bool isEmailValidator = false,
    bool isPasswordValidator = false,
  }) {
    if (value.length == 0) {
      return "$message is Required !";
    } else if (isEmailValidator == true) {
      if (value.isEmpty) {
        return "$message is Required !";
      } else if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value)) {
        return 'Enter Valid $message';
      }
    } else if (isPasswordValidator == true) {
      if (value.isEmpty) {
        return "$message is Required !";
      } else if (!RegExp(
          r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
          .hasMatch(value)) {
        if (value.length < 8) {
          return 'Password must have at least 8 characters';
        } else if (!value.contains(RegExp(r'[A-Z]'))) {
          return 'Password must have at least one uppercase characters';
        } else if (!value.contains(RegExp(r'[a-z]'))) {
          return 'Password must have at least one lowercase characters';
        } else if (!value.contains(RegExp(r'[0-9]'))) {
          return 'Password must have at least one number characters';
        } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
          return 'Password must have at least one special characters';
        } else {
          return "Passwords do not match";
        }
      }
    }
    return null;
  }
}