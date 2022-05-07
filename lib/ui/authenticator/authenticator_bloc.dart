import 'dart:async';
import 'package:base32/base32.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp/otp.dart';
import 'package:otp_generator/base/bloc_base.dart';
import 'package:otp_generator/base/bloc_form_validator.dart';
import 'package:otp_generator/utils/extensions.dart';
import 'package:rxdart/rxdart.dart';

import '../../base/bloc_error_handler.dart';
import '../../base/bloc_loading.dart';
import '../../data/remote/result.dart';
import '../../domain/2fa/authenticated_entity_model.dart';
import '../../domain/2fa/i_2fa_repository.dart';
import '../../res/R.dart';
import '../../utils/global_regexp.dart';

class AuthenticatorBloC extends BaseBloC with LoadingBloC, ErrorHandlerBloC, FormValidatorBloC {
  final I2faRepository _i2faRepository;

  AuthenticatorBloC(this._i2faRepository);

  @override
  void dispose() {
    disposeLoadingBloC();
    disposeErrorHandlerBloC();
    _dataController.close();
    expirationCountdown?.cancel();
    _timerController.close();
  }

  final BehaviorSubject<List<AuthenticatedEntity>> _dataController = BehaviorSubject.seeded([]);

  Stream<List<AuthenticatedEntity>> get dataResult => _dataController.stream;

  final BehaviorSubject<int> _timerController = BehaviorSubject.seeded(30);

  Stream<int> get timerResult => _timerController.stream;

  Timer? expirationCountdown;

  void loadData() async {
    isLoading = true;
    final res = await _i2faRepository.getApps();
    if (res is ResultSuccess<List<AuthenticatedEntity>>) {
      generateCodes(res.value);
    }
    isLoading = false;
  }

  void generateCodes(List<AuthenticatedEntity> list) {
    expirationCountdown?.cancel();
    for (var element in list) {
      element.code = OTP.generateTOTPCodeString(
          element.secret, DateTime.now().millisecondsSinceEpoch,
          algorithm: Algorithm.SHA1, isGoogle: true);
    }
    _dataController.sinkAddSafe(list);
    expirationCountdown = Timer.periodic(const Duration(seconds: 1), (time) {
      final remaining = 31 - OTP.remainingSeconds();
      OTP.lastUsedTime = DateTime.now().millisecondsSinceEpoch;
      _timerController.sinkAddSafe(remaining);
      if (_timerController.value == 30) {
        expirationCountdown?.cancel();
        generateCodes(list);
      }
    });
  }

  void processQrResult(String result) {
    final match = GlobalRegexp.otpauthExp.firstMatch(result);
    if (match != null) {
      final type =
          match.group(1) == OTPType.hotp.name ? OTPType.hotp : OTPType.totp;
      final label = Uri.decodeFull(match.group(2) ?? "");
      String issuer = "";
      String secret = "";
      for (var i = 3; i < match.groupCount + 1; i++) {
        if (match.group(i) != null) {
          if (match.group(i)!.trim().toLowerCase().startsWith("secret=")) {
            secret = match.group(i)!.split("=").last;
          } else if (match
              .group(i)!
              .trim()
              .toLowerCase()
              .startsWith("issuer=")) {
            issuer = Uri.decodeFull(match.group(i)!.split("=").last);
          }
        }
      }
      try {
        if(label.isNotEmpty && secret.isNotEmpty && base32.decodeAsString(secret).isNotEmpty) {
          createApp(issuer, label, type, secret);
        } else {
          showErrorMessageFromString(R.string.labelTextWarning);
        }
      } catch (ex) {
        showErrorMessageFromString(R.string.invalidBase32Chars);
      }
    } else {
      Fluttertoast.showToast(msg: result);
    }
  }

  Future<void> createApp(
      String issuer, String label, OTPType type, String secret) async {
    isLoading = true;
    final list = _dataController.value;
    final res = await _i2faRepository.createApp(issuer, label, secret, type);
    if (res is ResultSuccess<AuthenticatedEntity?> && res.value != null) {
      list.add(res.value!);
      generateCodes(list);
    }
    isLoading = false;
  }

  Future<void> removeApp(String appId) async {
    isLoading = true;
    await _i2faRepository.deleteApp(appId);
    final list = _dataController.value;
    list.removeWhere((element) => element.id == appId);
    _dataController.sinkAddSafe(list);
    isLoading = false;
  }

  Future<void> removeApps() async {
    isLoading = true;
    await _i2faRepository.deleteAllApps();
    final list = _dataController.value;
    list.clear();
    _dataController.sinkAddSafe(list);
    isLoading = false;
  }
}