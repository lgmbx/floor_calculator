class ValidatorHelper {
  static String isValidText(String value) {
    return value.isEmpty ? 'Required Field' : null;
  }
}
