import 'package:easy_localization/easy_localization.dart';
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
          color: Theme.of(context).colorScheme.primary,
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
            _errorText = 'error_invalid'.tr();
          case ValidationType.empty:
            _errorText = 'error_empty'.tr();
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
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
      keyboardType: widget.inputWrapper.textInputType,
      textInputAction: TextInputAction.next,
      textAlign: TextAlign.start,
      maxLines: 1,
      decoration: InputDecoration(
        suffixIcon: (widget.inputWrapper.fieldType == FieldType.password)
            ? passwordIcon()
            : null,
        errorText: _errorText,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: widget.inputWrapper.borderThickness,
                color: Theme.of(context).colorScheme.onPrimary)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: widget.inputWrapper.borderThickness,
                color: Theme.of(context).colorScheme.onError),
            borderRadius: BorderRadius.all(
                Radius.circular(widget.inputWrapper.borderRadius))),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                width: widget.inputWrapper.borderThickness,
                color: Theme.of(context).colorScheme.onPrimary),
            borderRadius: BorderRadius.all(
                Radius.circular(widget.inputWrapper.borderRadius))),
        label: Text(
          widget.inputWrapper.label,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
