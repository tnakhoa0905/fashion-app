import 'package:fashion_app/data/models/product/product_detail_model.dart';
import 'package:fashion_app/data/models/product/product_model.dart';
import 'package:fashion_app/domain/entities/product/product_detail_entity.dart';
import 'package:fashion_app/domain/entities/product/product_entity.dart';

extension ProdcutModelExtensions on ProductModel {
  ProductEntity toDomain() {
    return ProductEntity(
      id: id,
      name: name,
      price: price,
      currency: "USD",
      brandName: slug,
      colour: "",
      productCode: 0,
      url: 'permalink',
      imageUrl: fixImagePath(),
      additionalImageUrls: <String>[],
    );
  }

  String fixImagePath() {
    if (images != null) {
      return 'https://${'i.pinimg.com/1200x/d9/f8/6e/d9f86e705dc104e812c10873dd004ed5.jpg'}';
    } else {
      return "";
    }
  }
}

extension ProductDetailModelExtension on ProductDetailModel {
  ProductDetailEntity toDomain() {
    return ProductDetailEntity(
        id: id,
        name: name,
        slug: slug,
        permalink: permalink,
        dateCreated: dateCreated,
        dateCreatedGmt: dateCreatedGmt,
        dateModified: dateModified,
        dateModifiedGmt: dateModifiedGmt,
        type: type,
        status: status,
        featured: featured,
        catalogVisibility: catalogVisibility,
        description: description,
        shortDescription: shortDescription,
        sku: sku,
        price: price,
        images: fixImagesPath(),
        currentPrice: price);
  }

  List<String> fixImagesPath() {
    if (images != null) {
      return images.map((e) => '${e.src.toString()}').toList();
    } else {
      return <String>[];
    }
  }
}
