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
    if ('images' != null) {
      return 'https://${'i.pinimg.com/1200x/d9/f8/6e/d9f86e705dc104e812c10873dd004ed5.jpg'}';
    } else {
      return "";
    }
  }
}

extension ProductDetailModelExtension on ProductDetailModel {
  ProductDetailEntity toDomain() {
    return ProductDetailEntity(
      id: id ?? 0,
      name: name ?? "",
      description: description ?? "",
      categoryName: name ?? "",
      gender: "",
      productCode: "",
      brand: "",
      images: fixImagesPath(),
      currentPrice: 0.0,
      previousPrice: 0.0,
      currency: "USD",
      startDateTime: "",
    );
  }

  List<String> fixImagesPath() {
    if (images != null) {
      return images!.map((e) => 'https://${e.toString()}').toList();
    } else {
      return <String>[];
    }
  }
}
