import 'package:otp_generator/app.dart';
import 'package:otp_generator/res/values/colors.dart';
import 'package:otp_generator/res/values/dimens.dart';
import 'package:otp_generator/res/values/images.dart';
import 'package:otp_generator/res/values/sounds.dart';

import '../generated/l10n.dart';

class R {
  static final AppImage image = AppImage();
  static final AppDimens dim = AppDimens();
  static final AppColor color = AppColor();
  static final AppSounds sound = AppSounds();
  static final S string = S.of(OtpGeneratorApp.appGlobalKey.currentContext!);
}
