// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int id;
  String name;
  String slug;
  String permalink;
  DateTime dateCreated;
  DateTime dateCreatedGmt;
  DateTime dateModified;
  DateTime dateModifiedGmt;
  String type;
  String status;
  bool featured;
  String catalogVisibility;
  String description;
  String shortDescription;
  String sku;
  double price;
  List<dynamic> images;

  ProductModel(
      {required this.id,
      required this.name,
      required this.slug,
      required this.permalink,
      required this.dateCreated,
      required this.dateCreatedGmt,
      required this.dateModified,
      required this.dateModifiedGmt,
      required this.type,
      required this.status,
      required this.featured,
      required this.catalogVisibility,
      required this.description,
      required this.shortDescription,
      required this.sku,
      required this.price,
      required this.images});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        permalink: json["permalink"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        type: json["type"] ?? '',
        status: json["status"] ?? '',
        featured: json["featured"],
        catalogVisibility: json["catalog_visibility"],
        description: json["description"] ?? '',
        shortDescription: json["short_description"] ?? '',
        sku: json["sku"] ?? '',
        price: json["price"].toString() == "" ? 0 : json["price"] as double,
        images: List<dynamic>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "permalink": permalink,
        "date_created": dateCreated.toIso8601String(),
        "date_created_gmt": dateCreatedGmt.toIso8601String(),
        "date_modified": dateModified.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt.toIso8601String(),
        "type": type,
        "status": status,
        "featured": featured,
        "catalog_visibility": catalogVisibility,
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
