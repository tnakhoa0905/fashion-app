// To parse this JSON data, do
//
//     final userApi = userApiFromJson(jsonString);

import 'dart:convert';

UserApi userApiFromJson(String str) => UserApi.fromJson(json.decode(str));

String userApiToJson(UserApi data) => json.encode(data.toJson());

class UserApi {
  int id;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String email;
  String firstName;
  String lastName;
  String role;
  String username;
  Ing billing;
  Ing shipping;
  bool isPayingCustomer;
  String avatarUrl;
  List<dynamic> metaData;
  Links links;

  UserApi({
    required this.id,
    required this.dateCreated,
    required this.dateCreatedGmt,
    required this.dateModified,
    required this.dateModifiedGmt,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.username,
    required this.billing,
    required this.shipping,
    required this.isPayingCustomer,
    required this.avatarUrl,
    required this.metaData,
    required this.links,
  });

  factory UserApi.fromJson(Map<String, dynamic> json) => UserApi(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        role: json["role"],
        username: json["username"],
        billing: Ing.fromJson(json["billing"]),
        shipping: Ing.fromJson(json["shipping"]),
        isPayingCustomer: json["is_paying_customer"],
        avatarUrl: json["avatar_url"],
        metaData: List<dynamic>.from(json["meta_data"].map((x) => x)),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "role": role,
        "username": username,
        "billing": billing.toJson(),
        "shipping": shipping.toJson(),
        "is_paying_customer": isPayingCustomer,
        "avatar_url": avatarUrl,
        "meta_data": List<dynamic>.from(metaData.map((x) => x)),
        "_links": links.toJson(),
      };

  UserApi copyWith(
      {int? id,
      DateTime? dateCreated,
      DateTime? dateCreatedGmt,
      DateTime? dateModified,
      DateTime? dateModifiedGmt,
      String? email,
      String? firstName,
      String? lastName,
      String? role,
      String? username,
      Ing? billing,
      Ing? shipping,
      bool? isPayingCustomer,
      String? avatarUrl,
      List<dynamic>? metaData,
      Links? links}) {
    return UserApi(
        id: id ?? this.id,
        dateCreated: dateCreated ?? this.dateCreated,
        dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
        dateModified: dateModified ?? this.dateModified,
        dateModifiedGmt: dateModifiedGmt ?? this.dateModifiedGmt,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        role: role ?? this.role,
        username: username ?? this.username,
        billing: billing ?? this.billing,
        shipping: shipping ?? this.shipping,
        isPayingCustomer: isPayingCustomer ?? this.isPayingCustomer,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        metaData: metaData ?? this.metaData,
        links: links ?? this.links);
  }
}

class Ing {
  String firstName;
  String lastName;
  String company;
  String address1;
  String address2;
  String city;
  String postcode;
  String country;
  String state;
  String? email;
  String? phone;

  Ing({
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.address1,
    required this.address2,
    required this.city,
    required this.postcode,
    required this.country,
    required this.state,
    this.email,
    this.phone,
  });

  factory Ing.fromJson(Map<String, dynamic> json) => Ing(
        firstName: json["first_name"],
        lastName: json["last_name"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        postcode: json["postcode"],
        country: json["country"],
        state: json["state"],
        email: json["email"],
        phone: json["phone"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "postcode": postcode,
        "country": country,
        "state": state,
        "email": email,
        "phone": phone,
      };
}

class Links {
  List<Collection> self;
  List<Collection> collection;

  Links({
    required this.self,
    required this.collection,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Collection>.from(
            json["self"].map((x) => Collection.fromJson(x))),
        collection: List<Collection>.from(
            json["collection"].map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
      };
}

class Collection {
  String href;

  Collection({
    required this.href,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}
