import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../common/constants/gif.dart';

extension LoadingDialog on BuildContext {
  showLoadingDialog() {
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            GifRes.loading,
            height: 60,
            width: 60,
          ),
          Container(
              margin: const EdgeInsets.only(top: 12),
              child: Text("loading".tr())),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: this,
      builder: (BuildContext context) {
        return PopScope(canPop: false, child: alert);
      },
    );
  }

  hideLoadingDialog() {
    Navigator.pop(this);
  }
}
