


import 'package:flutter/material.dart';
import 'package:otp_generator/ui/tx_widgets/tx_blur_dialog.dart';
import 'package:otp_generator/ui/tx_widgets/tx_text_widget.dart';

import '../../base/navigation_utils.dart';
import '../../res/R.dart';

Future txShowWarningDialogBlur(
  BuildContext context, {
  required Widget title,
  required Widget content,
  double blurX = 2.0,
  double blurY = 2.0,
  bool yesNo = true,
  ValueChanged<bool>? onAction,
}) {
  return showBlurDialog(
      blurX: blurX,
      blurY: blurY,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: R.color.whiteColor,
          title: title,
          content: content,
          // content: TXTextWidget(
          //   text: content,
          //   textAlign: TextAlign.start,
          //   color: R.color.grayDarkestColor,
          //   textOverflow: TextOverflow.visible,
          // ),
          actions: <Widget>[
            TextButton(
              child: TXTextWidget(
                text: yesNo ? R.string.yes : R.string.ok,
                fontWeight: FontWeight.bold,
                color: R.color.darkColor,
              ),
              onPressed: () {
                NavigationUtils.pop(context);
                if (onAction != null) onAction(true);
              },
            ),
            yesNo
                ? TextButton(
                    child: TXTextWidget(
                      text: R.string.no,
                      fontWeight: FontWeight.bold,
                      color: R.color.darkColor,
                    ),
                    onPressed: () {
                      NavigationUtils.pop(context);
                      if (onAction != null) onAction(false);
                    },
                  )
                : Container(),
          ],
        );
      });
}

txShowWaringDialogMaterial(
  BuildContext context, {
  required Widget title,
  required Widget content,
  bool barrierDismissible = true,
  bool yesNo = true,
  ValueChanged<bool>? onAction,
  String? yesText,
  String? noText,
  bool alwaysPopDialog = true,
}) {
  return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
            backgroundColor: R.color.whiteColor,
            title: title,
            content: content,
            // content: TXTextWidget(
            //   text: content,
            //   textAlign: TextAlign.start,
            //   color: R.color.grayDarkestColor,
            //   textOverflow: TextOverflow.visible,
            // ),
            actions: <Widget>[
              TextButton(
                child: TXTextWidget(
                  text: yesNo ? (yesText ?? R.string.yes) : R.string.ok,
                  fontWeight: FontWeight.bold,
                  color: R.color.darkColor,
                ),
                onPressed: () {
                  if (alwaysPopDialog) Navigator.of(context).pop();
                  if (onAction != null) onAction(true);
                },
              ),
              yesNo
                  ? TextButton(
                      child: TXTextWidget(
                        text: noText ?? R.string.no,
                        fontWeight: FontWeight.bold,
                        color: R.color.darkColor,
                      ),
                      onPressed: () {
                        if (alwaysPopDialog) Navigator.of(context).pop();
                        if (onAction != null) onAction(false);
                      },
                    )
                  : Container(),
            ],
          ));
}
