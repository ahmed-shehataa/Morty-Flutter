import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morty_flutter/base/pagination/retry_button.dart';
import 'package:morty_flutter/core/common/constants/svg.dart';

class BaseErrorWidget extends StatelessWidget {
  const BaseErrorWidget(this._onTry, this._errorMessage, {super.key});

  final VoidCallback _onTry;
  final _errorMessage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SvgPicture.asset(
            SvgRes.errorPlaceHolder,
            width: 200,
          ),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(_errorMessage)),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: RetryButton(_onTry),
          )
        ],
      ),
    );
  }
}
