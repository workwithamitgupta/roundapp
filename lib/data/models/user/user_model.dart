class User {
  Data? data;

  User({this.data});

  factory User.fromJson(Map<String, dynamic> json) => User(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  int? id;
  String? name;
  dynamic role;
  String? email;
  DateTime? createdAt;
  bool? verified;
  DateTime? lastLoginAt;
  String? lastLoginIp;
  Image? image;
  dynamic favouritePaymentAccount;
  String? accId;

  Data({
    this.id,
    this.name,
    this.role,
    this.email,
    this.createdAt,
    this.verified,
    this.lastLoginAt,
    this.lastLoginIp,
    this.image,
    this.favouritePaymentAccount,
    this.accId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        role: json["role"],
        email: json["email"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        verified: json["verified"],
        lastLoginAt: json["last_login_at"] == null
            ? null
            : DateTime.parse(json["last_login_at"]),
        lastLoginIp: json["last_login_ip"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        favouritePaymentAccount: json["favouritePaymentAccount"],
        accId: json['acc_id'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
        "email": email,
        "created_at": createdAt?.toIso8601String(),
        "verified": verified,
        "last_login_at": lastLoginAt?.toIso8601String(),
        "last_login_ip": lastLoginIp,
        "image": image?.toJson(),
        "favouritePaymentAccount": favouritePaymentAccount,
        "acc_Id": accId,
      };
}

class Image {
  int? id;
  String? uuid;
  String? url;

  String? type;
  String? path;
  String? fullPath;
  int? size;
  String? mimeType;
  String? originalName;
  String? name;
  String? description;
  String? hashAlg;
  String? hashFile;

  Image({
    this.id,
    this.uuid,
    this.url,
    this.type,
    this.path,
    this.fullPath,
    this.size,
    this.mimeType,
    this.originalName,
    this.name,
    this.description,
    this.hashAlg,
    this.hashFile,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        uuid: json["uuid"],
        url: json["url"],
        type: json["type"],
        path: json["path"],
        fullPath: json["fullPath"],
        size: json["size"],
        mimeType: json["mime_type"],
        originalName: json["original_name"],
        name: json["name"],
        description: json["description"],
        hashAlg: json["hash_alg"],
        hashFile: json["hash_file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "url": url,
        "type": type,
        "path": path,
        "fullPath": fullPath,
        "size": size,
        "mime_type": mimeType,
        "original_name": originalName,
        "name": name,
        "description": description,
        "hash_alg": hashAlg,
        "hash_file": hashFile,
      };
}
