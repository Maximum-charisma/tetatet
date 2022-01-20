import 'dart:convert';

PacksModel packsModelFromJson(String str) =>
    PacksModel.fromJson(json.decode(str));

String packsModelToJson(PacksModel data) => json.encode(data.toJson());

class PacksModel {
  PacksModel({
    required this.code,
    required this.message,
    required this.pack,
  });

  String code;
  String message;
  List<Pack> pack;

  factory PacksModel.fromJson(Map<String, dynamic> json) => PacksModel(
        code: json["code"],
        message: json["message"],
        pack: List<Pack>.from(json["pack"].map((x) => Pack.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "pack": List<dynamic>.from(pack.map((x) => x.toJson())),
      };
}

class Pack {
  Pack({
    required this.id,
    required this.name,
    required this.productId,
    required this.description,
    required this.about,
    required this.rules,
    required this.image,
    required this.age,
    required this.lock,
    required this.popularity,
    required this.size,
  });

  String id;
  String name;
  String productId;
  String description;
  String about;
  String rules;
  String image;
  String age;
  String lock;
  String popularity;
  String size;

  factory Pack.fromJson(Map<String, dynamic> json) => Pack(
        id: json["id"],
        name: json["name"],
        productId: json["product_id"],
        description: json["description"],
        about: json["about"],
        rules: json["rules"],
        image: json["image"],
        age: json["age"],
        lock: json["lock"],
        popularity: json["popularity"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_id": productId,
        "description": description,
        "about": about,
        "rules": rules,
        "image": image,
        "age": age,
        "lock": lock,
        "popularity": popularity,
        "size": size,
      };
}

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.code,
    required this.message,
  });

  String code;
  String message;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

