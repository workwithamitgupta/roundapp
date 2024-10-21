class RegistrationModel {
  String tokenType;
  int expiresIn;
  String accessToken;
  String refreshToken;
  int id;
  String name;
  dynamic role;
  String email;
  DateTime createdAt;
  bool verified;
  dynamic lastLoginAt;
  dynamic lastLoginIp;
  dynamic image;
  dynamic favouritePaymentAccount;

  RegistrationModel({
    required this.tokenType,
    required this.expiresIn,
    required this.accessToken,
    required this.refreshToken,
    required this.id,
    required this.name,
    required this.role,
    required this.email,
    required this.createdAt,
    required this.verified,
    required this.lastLoginAt,
    required this.lastLoginIp,
    required this.image,
    required this.favouritePaymentAccount,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        id: json["id"],
        name: json["name"],
        role: json["role"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        verified: json["verified"],
        lastLoginAt: json["last_login_at"],
        lastLoginIp: json["last_login_ip"],
        image: json["image"],
        favouritePaymentAccount: json["favouritePaymentAccount"],
      );

  Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "expires_in": expiresIn,
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "id": id,
        "name": name,
        "role": role,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "verified": verified,
        "last_login_at": lastLoginAt,
        "last_login_ip": lastLoginIp,
        "image": image,
        "favouritePaymentAccount": favouritePaymentAccount,
      };
}
