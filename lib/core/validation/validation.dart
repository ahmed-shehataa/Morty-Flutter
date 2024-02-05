enum ValidationType { valid, inValid, empty }


extension Validation on String {
  bool isEmailValid() {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(this);
  }

  bool isEmailPassword() {
    return length > 8;
  }

}
