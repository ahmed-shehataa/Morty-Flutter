import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morty_flutter/base/pagination/widgets/retry_button.dart';
import 'package:morty_flutter/core/common/constants/svg.dart';

class BaseErrorWidget extends StatelessWidget {
  const BaseErrorWidget(this._onTry, this._errorMessage, {super.key});

  final VoidCallback _onTry;
  final _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          SvgRes.errorPlaceHolder,
          width: 200,
        ),
        const SizedBox(height: 8),
        Text(
          _errorMessage,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Theme.of(context).colorScheme.error),
        ),
        const SizedBox(height: 8),
        RetryButton(_onTry)
      ],
    );
  }
}
