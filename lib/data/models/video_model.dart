class Videos {
  List<VideosData>? data;

  Videos({
    this.data,
  });

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        data: json["data"] == null
            ? []
            : List<VideosData>.from(
                json["data"]!.map((x) => VideosData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class VideosData {
  int? id;
  String? title;
  String? description;
  Video? video;
  num? budget;
  double? reward;
  List<Tag>? tags;
  String? age;
  String? gender;
  String? geolocation;
  String? paymentType;
  int? people;

  VideosData({
    this.id,
    this.title,
    this.description,
    this.video,
    this.budget,
    this.reward,
    this.tags,
    this.age,
    this.gender,
    this.geolocation,
    this.paymentType,
    this.people,
  });

  factory VideosData.fromJson(Map<String, dynamic> json) => VideosData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        video: json["video"] == null ? null : Video.fromJson(json["video"]),
        budget: json["budget"],
        reward: json["reward"]?.toDouble(),
        tags: json["tags"] == null
            ? []
            : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
        age: json["age"],
        gender: json["gender"],
        geolocation: json["geolocation"],
        paymentType: json["paymentType"],
        people: json["people"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "video": video?.toJson(),
        "budget": budget,
        "reward": reward,
        "tags": tags == null ? <Tag>[] : List<Tag>.from(tags!.map((x) => x)),
        "age": age,
        "gender": gender,
        "geolocation": geolocation,
        "paymentType": paymentType,
        "people": people,
      };
}

class Video {
  int? id;
  String? title;
  String? url;
  Image? image;

  Video({
    this.id,
    this.title,
    this.url,
    this.image,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        image: json["image"] != null ? Image.fromJson(json["image"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "image": image?.toJson(),
      };
}

class Tag {
  final String code;

  Tag({required this.code});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(code: json['code']);

  Map<String, dynamic> toJson() => {
        'code': code,
      };
}

class Image {
  final String? url;

  Image({this.url});
  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json['url'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'url': url,
      };
}
