import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:morty_flutter/core/common/constants/svg.dart';

class BaseEmptyWidget extends StatelessWidget {
  const BaseEmptyWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SvgPicture.asset(
            SvgRes.emptyPlaceHolder,
            width: 200,
          ),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: const Text("empty_morty").tr()),
        ],
      ),
    );
  }
}
