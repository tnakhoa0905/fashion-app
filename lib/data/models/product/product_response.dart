import 'package:fashion_app/data/models/product/product_model.dart';

class ProductResponse {
  final List<ProductModel>? products;
  ProductResponse({
    this.products,
  });

  factory ProductResponse.fromJson(List<ProductModel> json) {
    print('ok ne');
    return ProductResponse(products: json
        // json['products'] != null
        //     ? List<ProductModel>.from(
        //         (json['products'] as List).map(
        //           (x) => ProductModel.fromJson(x as Map<String, dynamic>),
        //         ),
        //       )
        //     : null,
        );
  }
}
