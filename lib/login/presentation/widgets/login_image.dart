import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/common/constants/images.dart';


class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ImagesRes.login,
      width: 150,
      height: 150,
    );
  }
}
