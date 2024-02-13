import 'package:flutter/material.dart';
import 'package:morty_flutter/core/validation/validation.dart';

enum FieldType { text, email, password }

class InputWrapper {
  final FieldType fieldType;
  final String label;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Color borderErrorColor = Colors.red;
  final Color borderNormalColor = Colors.grey;
  final double borderThickness = 1;
  final double borderRadius = 12;
  final void Function(bool) isValid;

  ValidationType _validationType = ValidationType.empty;
  var text = "";

  InputWrapper(this.fieldType, this.label, this.textInputType,
      this.textInputAction, this.isValid);

  ValidationType onValueChange(String input) {
    text = input;
    debugPrint("onValueChange:: $text");
    _checkValidation();
    _checkIsValid();
    return _validationType;
  }

  _checkIsValid() {
    if (_validationType case ValidationType.valid) {
      isValid(true);
    } else {
      isValid(false);
    }
  }

  _checkValidation() {
    switch (fieldType) {
      case FieldType.text:
        {
          // TODO
        }
      case FieldType.email:
        {
          if (text.isEmpty) {
            _validationType = ValidationType.empty;
          } else if (text.isEmailValid()) {
            _validationType = ValidationType.valid;
          } else {
            _validationType = ValidationType.inValid;
          }
        }
      case FieldType.password:
        {
          if (text.isEmpty) {
            _validationType = ValidationType.empty;
          } else if (text.isEmailPassword()) {
            _validationType = ValidationType.valid;
          } else {
            _validationType = ValidationType.inValid;
          }
        }
    }
  }
}
