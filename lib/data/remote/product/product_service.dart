// import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fashion_app/core/utils/constants.dart';
import 'package:fashion_app/data/models/product/product_detail_model.dart';
import 'package:fashion_app/data/models/product/product_model.dart';
import 'package:fashion_app/data/models/product/product_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/retrofit.dart';
// import 'package:http/http.dart';

part 'product_service.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ProductService {
  factory ProductService(Dio dio, {String? baseUrl}) = _ProductService;

  @GET(AppConstants.productDetailEndPoint)
  Future<ProductDetailModel> getProdcutDetail({@Query('id') required int id});

  @GET(AppConstants.productEndPoint)
  Future<ProductResponse> getProdcuts(
    int perPage, {
    @Queries() required Map<String, dynamic> queriesParameters,
  });
}
