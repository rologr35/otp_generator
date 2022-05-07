// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Accept"),
        "appName": MessageLookupByLibrary.simpleMessage("OTPGenerator"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "copiedToClipboard":
            MessageLookupByLibrary.simpleMessage("Copied to clipboard!"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteAll": MessageLookupByLibrary.simpleMessage("Delete All"),
        "enablePermission": MessageLookupByLibrary.simpleMessage(
            "Enable permission in settings?"),
        "enterKeyManually":
            MessageLookupByLibrary.simpleMessage("Enter key manually"),
        "fieldRequired": MessageLookupByLibrary.simpleMessage("Field required"),
        "invalidBase32Chars":
            MessageLookupByLibrary.simpleMessage("Invalid base32 characters"),
        "label": MessageLookupByLibrary.simpleMessage("Label"),
        "labelTextWarning": MessageLookupByLibrary.simpleMessage(
            "Label is empty, please check this value"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "operationConfirmation": MessageLookupByLibrary.simpleMessage(
            "Are you sure of this operation?"),
        "otpLabelWarning": MessageLookupByLibrary.simpleMessage(
            "OTP label is an alphanumeric string without spaces :@.,;()\\\$% are also allowed"),
        "permissionDenied":
            MessageLookupByLibrary.simpleMessage("Permission denied"),
        "qrScanner": MessageLookupByLibrary.simpleMessage("QR"),
        "secretCode": MessageLookupByLibrary.simpleMessage("Secret key"),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
