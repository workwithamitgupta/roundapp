import '../video_model.dart';

class TagListModel {
  Data? data;

  TagListModel({
    this.data,
  });

  factory TagListModel.fromJson(Map<String, dynamic> json) => TagListModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  List<Tag>? tags;
  List<Producer>? producers;
  List<Age>? ages;
  List<Gender>? genders;
  List<Age>? paymentTypes;
  String? reward;

  Data({
    this.tags,
    this.producers,
    this.ages,
    this.genders,
    this.paymentTypes,
    this.reward,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
        producers: json["producers"] == null
            ? []
            : List<Producer>.from(
                json["producers"]!.map((x) => Producer.fromJson(x))),
        ages: json["ages"] == null
            ? []
            : List<Age>.from(json["ages"]!.map((x) => Age.fromJson(x))),
        genders: json["genders"] == null
            ? []
            : List<Gender>.from(
                json["genders"]!.map((x) => Gender.fromJson(x))),
        paymentTypes: json["paymentTypes"] == null
            ? []
            : List<Age>.from(json["paymentTypes"]!.map((x) => Age.fromJson(x))),
        reward: json["reward"],
      );

  Map<String, dynamic> toJson() => {
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "producers": producers == null
            ? []
            : List<dynamic>.from(producers!.map((x) => x.toJson())),
        "ages": ages == null
            ? []
            : List<dynamic>.from(ages!.map((x) => x.toJson())),
        "genders": genders == null
            ? []
            : List<dynamic>.from(genders!.map((x) => x.toJson())),
        "paymentTypes": paymentTypes == null
            ? []
            : List<dynamic>.from(paymentTypes!.map((x) => x.toJson())),
        "reward": reward,
      };
}

class Age {
  String? id;
  String? text;

  Age({
    this.id,
    this.text,
  });

  factory Age.fromJson(Map<String, dynamic> json) => Age(
        id: json["id"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
      };
}

class Gender {
  String? id;
  String? text;
  int? value;

  Gender({
    this.id,
    this.text,
    this.value,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        id: json["id"],
        text: json["text"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "value": value,
      };
}

class Producer {
  int? id;
  ProducerUser? user;
  dynamic image;
  String? name;
  String? description;
  String? website;

  Producer({
    this.id,
    this.user,
    this.image,
    this.name,
    this.description,
    this.website,
  });

  factory Producer.fromJson(Map<String, dynamic> json) => Producer(
        id: json["id"],
        user: json["user"] == null ? null : ProducerUser.fromJson(json["user"]),
        image: json["image"],
        name: json["name"],
        description: json["description"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user?.toJson(),
        "image": image,
        "name": name,
        "description": description,
        "website": website,
      };
}

class ProducerUser {
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

  ProducerUser({
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
  });

  factory ProducerUser.fromJson(Map<String, dynamic> json) => ProducerUser(
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
      };
}

class Image {
  int? id;
  String? uuid;
  String? url;
  ImageUser? user;
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
    this.user,
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
        user: json["user"] == null ? null : ImageUser.fromJson(json["user"]),
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
        "user": user?.toJson(),
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

class ImageUser {
  int? id;
  int? someoneId;
  String? someoneType;
  dynamic paymentAccountId;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  DateTime? lastLoginAt;
  String? lastLoginIp;
  DateTime? createdAt;
  DateTime? updatedAt;

  ImageUser({
    this.id,
    this.someoneId,
    this.someoneType,
    this.paymentAccountId,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.lastLoginAt,
    this.lastLoginIp,
    this.createdAt,
    this.updatedAt,
  });

  factory ImageUser.fromJson(Map<String, dynamic> json) => ImageUser(
        id: json["id"],
        someoneId: json["someone_id"],
        someoneType: json["someone_type"],
        paymentAccountId: json["payment_account_id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        lastLoginAt: json["last_login_at"] == null
            ? null
            : DateTime.parse(json["last_login_at"]),
        lastLoginIp: json["last_login_ip"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "someone_id": someoneId,
        "someone_type": someoneType,
        "payment_account_id": paymentAccountId,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "last_login_at": lastLoginAt?.toIso8601String(),
        "last_login_ip": lastLoginIp,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
