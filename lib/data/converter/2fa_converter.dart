

import '../../domain/2fa/authenticated_entity_model.dart';
import '../../domain/2fa/i_2fa_converter.dart';

class TwoFaConverter implements I2faConverter {
  @override
  AuthenticatedEntity fromJson(Map<String, dynamic> json) {
    return AuthenticatedEntity(
        id: json["_id"],
        type: json["type"] == OTPType.hotp.name ? OTPType.hotp : OTPType.totp,
        issuer: json["issuer"] ?? "",
        label: json["label"] ?? "",
        secret: json["secret"]);
  }

  @override
  Map<String, dynamic> toJson(AuthenticatedEntity model) {
    return {
      "type": model.type.name,
      "issuer": model.issuer,
      "label": model.label,
      "secret": model.secret
    };
  }
}
