class Util {
// helper function to throw exception when value is less than or equal to zero
  static void isGreaterThanZero(num val) {
    if (val <= 0) {
      throw Exception("Value must be greater than zero.");
    }
  }

// helper function to check if given string is a number
  static bool isNumeric(String s) {
    return double.tryParse(s) != null;
  }
}
