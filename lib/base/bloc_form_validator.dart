

import 'package:flutter/material.dart';

import '../res/R.dart';
import '../utils/global_regexp.dart';
import 'package:base32/base32.dart';

class FormValidatorBloC {

  FormFieldValidator otpLabelValidator() {
    FormFieldValidator validator = (value) {
      return (value?.toString().trim().isEmpty == true)
          ? R.string.fieldRequired
          : !GlobalRegexp.otpLabel.hasMatch(value?.toString().trim() ?? "")
          ? R.string.otpLabelWarning
          : null;
    };
    return validator;
  }

  FormFieldValidator otpSecretValidator() {
    FormFieldValidator validator = (value) {
      try {
        return (value?.toString().trim().isEmpty == true)
            ? R.string.fieldRequired
            : base32.decodeAsString(value).isEmpty
            ? R.string.invalidBase32Chars
            : null;
      } catch (ex) {
        return R.string.invalidBase32Chars;
      }
    };
    return validator;
  }

  FormFieldValidator required() {
    FormFieldValidator validator = (value) {
      return (value?.toString().trim().isEmpty == true)
          ? R.string.fieldRequired
          : null;
    };
    return validator;
  }

}
