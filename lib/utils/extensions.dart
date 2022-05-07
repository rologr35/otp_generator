import 'dart:async';
import 'package:flutter/cupertino.dart';

extension SafeSink<T> on StreamController<T> {
  void sinkAddSafe(T value) {
    if (!isClosed) sink.add(value);
  }
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this?.isEmpty == true;

  String? toCapitalize() {
    if (this?.trim().isNotEmpty == true) {
      String? subString = this?.substring(0, 1);
      if (subString != null) {
        return this?.trim().replaceFirst(subString, subString.toUpperCase());
      }
      return this;
    } else {
      return this;
    }
  }

  bool isUpperCase() {
    if (this == null) {
      return false;
    }
    if (this?.isEmpty == true) {
      return false;
    }
    if (this?.trimLeft().isEmpty == true) {
      return false;
    }
    String? firstLetter = this?.trimLeft().substring(0, 1);
    if (double.tryParse(firstLetter!) != null) {
      return false;
    }
    return firstLetter.toUpperCase() == this?.substring(0, 1);
  }
}

extension ColorExtension on Color {
  Color darken([double amount = .04]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .04]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
    return hslLight.toColor();
  }
}
