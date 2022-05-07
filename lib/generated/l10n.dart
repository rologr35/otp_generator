// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `OTPGenerator`
  String get appName {
    return Intl.message(
      'OTPGenerator',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid base32 characters`
  String get invalidBase32Chars {
    return Intl.message(
      'Invalid base32 characters',
      name: 'invalidBase32Chars',
      desc: '',
      args: [],
    );
  }

  /// `Label is empty, please check this value`
  String get labelTextWarning {
    return Intl.message(
      'Label is empty, please check this value',
      name: 'labelTextWarning',
      desc: '',
      args: [],
    );
  }

  /// `Secret key`
  String get secretCode {
    return Intl.message(
      'Secret key',
      name: 'secretCode',
      desc: '',
      args: [],
    );
  }

  /// `Label`
  String get label {
    return Intl.message(
      'Label',
      name: 'label',
      desc: '',
      args: [],
    );
  }

  /// `OTP label is an alphanumeric string without spaces :@.,;()\$% are also allowed`
  String get otpLabelWarning {
    return Intl.message(
      'OTP label is an alphanumeric string without spaces :@.,;()\\\$% are also allowed',
      name: 'otpLabelWarning',
      desc: '',
      args: [],
    );
  }

  /// `QR`
  String get qrScanner {
    return Intl.message(
      'QR',
      name: 'qrScanner',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Field required`
  String get fieldRequired {
    return Intl.message(
      'Field required',
      name: 'fieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Delete All`
  String get deleteAll {
    return Intl.message(
      'Delete All',
      name: 'deleteAll',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure of this operation?`
  String get operationConfirmation {
    return Intl.message(
      'Are you sure of this operation?',
      name: 'operationConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Copied to clipboard!`
  String get copiedToClipboard {
    return Intl.message(
      'Copied to clipboard!',
      name: 'copiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Enter key manually`
  String get enterKeyManually {
    return Intl.message(
      'Enter key manually',
      name: 'enterKeyManually',
      desc: '',
      args: [],
    );
  }

  /// `Permission denied`
  String get permissionDenied {
    return Intl.message(
      'Permission denied',
      name: 'permissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Enable permission in settings?`
  String get enablePermission {
    return Intl.message(
      'Enable permission in settings?',
      name: 'enablePermission',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
