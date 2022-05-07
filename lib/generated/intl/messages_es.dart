// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accept": MessageLookupByLibrary.simpleMessage("Aceptar"),
        "appName": MessageLookupByLibrary.simpleMessage("OTPGenerator"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "copiedToClipboard":
            MessageLookupByLibrary.simpleMessage("Copiado al portapapeles!"),
        "delete": MessageLookupByLibrary.simpleMessage("Eliminar"),
        "deleteAll": MessageLookupByLibrary.simpleMessage("Eliminar todo"),
        "enablePermission": MessageLookupByLibrary.simpleMessage(
            "Habilitar permiso en Ajustes?"),
        "enterKeyManually":
            MessageLookupByLibrary.simpleMessage("Ingresar clave manualmente"),
        "fieldRequired":
            MessageLookupByLibrary.simpleMessage("Campo requerido"),
        "invalidBase32Chars": MessageLookupByLibrary.simpleMessage(
            "Caracteres base32 no válidos"),
        "label": MessageLookupByLibrary.simpleMessage("Etiqueta"),
        "labelTextWarning": MessageLookupByLibrary.simpleMessage(
            "La etiqueta está vacía, por favor chequee este valor"),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "operationConfirmation": MessageLookupByLibrary.simpleMessage(
            "Está seguro de esta operación?"),
        "otpLabelWarning": MessageLookupByLibrary.simpleMessage(
            "La etiqueta otp es una cadena alfanumérica sin espacios que también admite :@.,;()\\\$%"),
        "permissionDenied":
            MessageLookupByLibrary.simpleMessage("Permiso denegado"),
        "qrScanner": MessageLookupByLibrary.simpleMessage("QR"),
        "secretCode": MessageLookupByLibrary.simpleMessage("Clave"),
        "yes": MessageLookupByLibrary.simpleMessage("Si")
      };
}
