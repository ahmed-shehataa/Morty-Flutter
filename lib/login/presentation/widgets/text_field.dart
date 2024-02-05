import 'package:flutter/material.dart';

import '../../../core/validation/input_wrapper.dart';
import '../../../core/validation/validation.dart';

class BaseTextField extends StatefulWidget {
  final InputWrapper inputWrapper;

  const BaseTextField(this.inputWrapper, {super.key});

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  final _controller = TextEditingController();
  var _errorText;
  var _passwordVisible = false;

  Widget passwordIcon() {
    return IconButton(
        icon: Icon(
          _passwordVisible ? Icons.visibility : Icons.visibility_off,
          color: Theme.of(context).primaryColorDark,
        ),
        onPressed: () {
          setState(() {
            _passwordVisible = !_passwordVisible;
          });
        });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        switch (widget.inputWrapper.onValueChange(_controller.text)) {
          case ValidationType.valid:
            _errorText = null;
          case ValidationType.inValid:
            _errorText = 'InValid';
          case ValidationType.empty:
            _errorText = 'Can\'t be empty';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (widget.inputWrapper.fieldType == FieldType.password &&
          !_passwordVisible),
      controller: _controller,
      keyboardType: widget.inputWrapper.textInputType,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.start,
      maxLines: 1,
      decoration: InputDecoration(
        suffixIcon: (widget.inputWrapper.fieldType == FieldType.password)
            ? passwordIcon()
            : null,
        errorText: _errorText,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: widget.inputWrapper.borderThickness,
                color: widget.inputWrapper.borderErrorColor),
            borderRadius: BorderRadius.all(
                Radius.circular(widget.inputWrapper.borderRadius))),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                width: widget.inputWrapper.borderThickness,
                color: widget.inputWrapper.borderNormalColor),
            borderRadius: BorderRadius.all(
                Radius.circular(widget.inputWrapper.borderRadius))),
        label: Text(widget.inputWrapper.label),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
