import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductDetailEntity extends Equatable {
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
  double currentPrice;

  ProductDetailEntity(
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
      required this.images,
      required this.currentPrice});

  @override
  List<Object> get props {
    return [
      id,
      name,
      slug,
      permalink,
      dateCreated,
      dateCreatedGmt,
      dateModified,
      dateModifiedGmt,
      type,
      status,
      featured,
      catalogVisibility,
      description,
      shortDescription,
      sku,
      price,
      images,
      currentPrice
    ];
  }
}
