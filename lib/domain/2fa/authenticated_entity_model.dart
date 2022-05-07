
enum OTPType { totp, hotp }

class AuthenticatedEntity {
  String id, issuer, label, code, secret;
  OTPType type;

  AuthenticatedEntity(
      {required this.id,
      this.type = OTPType.totp,
      this.issuer = "",
      this.label = "",
      required this.secret,
      this.code = ""});
}
