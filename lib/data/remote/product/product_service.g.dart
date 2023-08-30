// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ProductService implements ProductService {
  _ProductService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://martsimple.com/wp-json';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ProductDetailModel> getProdcutDetail({required int id}) async {
    print('getProduct ProductService Detail');
    // const _extra = <String, dynamic>{};
    // final queryParameters = <String, dynamic>{r'id': id};
    // final _headers = <String, dynamic>{};
    // const Map<String, dynamic>? _data = null;
    // final _result = await _dio
    //     .fetch<Map<String, dynamic>>(_setStreamType<ProductDetailModel>(Options(
    //   method: 'GET',
    //   headers: _headers,
    //   extra: _extra,
    // )
    //         .compose(
    //           _dio.options,
    //           '/products/v3/detail',
    //           queryParameters: queryParameters,
    //           data: _data,
    //         )
    //         .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    // final value = ProductDetailModel.fromJson(_result.data!);
    // return value;
    try {
      print('getProduct ProductService');
      const _extra = <String, dynamic>{};
      final queryParameterFunc = {
        'consumer_key': dotenv.env['CONSUMER_KEY'],
        'consumer_secret': dotenv.env['CONSUMER_SECRET'],
      };
      // queryParameters.addAll(queriesParameters);
      final _headers = <String, dynamic>{};
      const Map<String, dynamic>? _data = null;
      final _result = await _dio.fetch(_setStreamType<ProductResponse>(Options(
        method: 'GET',
        headers: _headers,
        extra: _extra,
      )
          .compose(
            _dio.options,
            '/wc/v3/products/$id',
            queryParameters: queryParameterFunc,
            data: _data,
          )
          .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
      ProductDetailModel value;
      var result = _result.data!;

      value = ProductDetailModel.fromJson(result);
      return value;
    } on DioException catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<ProductResponse> getProdcuts(int perPage,
      {required Map<String, dynamic> queriesParameters}) async {
    print(queriesParameters['categoryId']);
    try {
      print('getProduct ProductService');
      const _extra = <String, dynamic>{};
      final queryParameterFunc = {
        'consumer_key': dotenv.env['CONSUMER_KEY'],
        'consumer_secret': dotenv.env['CONSUMER_SECRET'],
        'per_page': perPage,
        'category': queriesParameters['categoryId']
      };
      // queryParameters.addAll(queriesParameters);
      final _headers = <String, dynamic>{};
      const Map<String, dynamic>? _data = null;
      final _result = await _dio.fetch(_setStreamType<ProductResponse>(Options(
        method: 'GET',
        headers: _headers,
        extra: _extra,
      )
          .compose(
            _dio.options,
            '/wc/v3/products',
            queryParameters: queryParameterFunc,
            data: _data,
          )
          .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
      List<ProductModel>? value;
      var result = _result.data! as List<dynamic>;
      value = List<ProductModel>.from(result.map((e) {
        print('***********du lieu json************');
        print(e['id'].runtimeType);
        print(e['images'].runtimeType);
        print(e['price'].runtimeType);
        print('***********parse***************');
        final result = ProductModel.fromJson(e);
        if (result.images.isNotEmpty) {
          print(result.images[0].id.runtimeType);
          print(result.id.runtimeType);
          print(result.price.runtimeType);
        }

        return ProductModel.fromJson(e);
      }));

      return ProductResponse.fromJson(value);
    } on DioException catch (e) {
      throw Exception(e);
    }

    // final param = {
    //   'consumer_key': dotenv.env['CONSUMER_KEY'],
    //   'consumer_secret': dotenv.env['CONSUMER_SECRET'],
    // };
    // final response = await http.get(
    //   Uri.https('martsimple.com', '/wp-json/wc/v3/customers', param),
    //   headers: {
    //     'Content-Type': 'text/plain',
    //   },
    // );
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    print('getProduct ProductService');
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
