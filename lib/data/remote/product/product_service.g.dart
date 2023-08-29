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
      final queryParameters = {
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
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
      print('formating');
      ProductDetailModel value;
      var result = _result.data!;

      print(result);

      print('parse');
      print('name' + result['name'].runtimeType.toString());
      print(result['slug'].runtimeType);
      print('perma' + result['permalink'].runtimeType.toString());
      print(result['date_created'].runtimeType);
      print(result['date_created_gmt'].runtimeType);
      print(result['date_modified'].runtimeType);
      print(result['date_modified_gmt'].runtimeType);
      print(result['type'].runtimeType);
      print(result['status'].runtimeType);
      print(result['featured'].runtimeType);
      print(result['catalog_visibility'].runtimeType);
      print('des ${result['description'].runtimeType}');
      print('dessss${result['short_description'].runtimeType}');
      print(result['sku'].runtimeType);
      print(result['price'].runtimeType);
      print(result['id'].runtimeType);

      value = ProductDetailModel.fromJson(result);
      print(value.id);

      print('done parse');
      return value;
    } on DioException catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Future<ProductResponse> getProdcuts(
      {required Map<String, dynamic> queriesParameters}) async {
    try {
      print('getProduct ProductService');
      const _extra = <String, dynamic>{};
      final queryParameters = {
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
            '/wc/v3/products',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
      List<ProductModel>? value;
      var result = _result.data! as List<dynamic>;
      value =
          List<ProductModel>.from(result.map((e) => ProductModel.fromJson(e)));

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
