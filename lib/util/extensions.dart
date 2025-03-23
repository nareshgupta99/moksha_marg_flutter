extension StringExtensions on String {
  bool isValidEmail() {
    return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(this);
  }

  bool isValidPhone() {
    return length > 7;
  }

  bool isInvalidPassword() {
    return length < 8;
  }

  bool isValidOtp(){
    return length == 6;
  }


}