import 'dart:convert';
import 'dart:developer';
import 'package:fashion_app/data/models/order/order_model.dart';
import 'package:fashion_app/domain/entities/account/user_api.dart';
import 'package:fashion_app/domain/entities/product/product_detail_entity.dart';
import 'package:http/http.dart' as http;

abstract class OrderService {
  Future<void> createOrder(
      UserApi userModel, Map<ProductDetailEntity, int> listProduct);
  Future<List<OrderModel>> getAllOrderById(int customerId);
}

class OrderServiceImpl implements OrderService {
  double subTotal(Map<ProductDetailEntity, int> carts) {
    final sTotal = carts.entries
        .map((e) => e.key.currentPrice * e.value)
        .reduce((value, element) => value + element);

    return sTotal;
  }

  @override
  Future<void> createOrder(
      UserApi userModel, Map<ProductDetailEntity, int> listProduct) async {
    List<Map<String, dynamic>> listInJson = [];
    for (final item in listProduct.entries) {
      listInJson.add({
        "product_id": item.key.id,
        "name": item.key.name,
        "quantity": item.value,
        "total": (item.key.price * item.value).toString(),
        "price": item.key.price,
      });
    }

    try {
      print("create order in  OrderService");
      final param = {
        'consumer_key': 'ck_b224bb54e462bfa5adb9f220fe7af19cdf3355ba',
        'consumer_secret': 'cs_95eeec6d48257b3cd5d085c376228d1d5f9bf4eb',
      };
      final response = await http.post(
          Uri.https('martsimple.com', '/wp-json/wc/v3/orders', param),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "customer_id": userModel.id,
            "payment_method": "bacs",
            "payment_method_title": "Direct Bank Transfer",
            "set_paid": true,
            "billing": userModel.billing.toJson(),
            "shipping": userModel.shipping.toJson(),
            "line_items": listInJson,
            "shipping_lines": [
              {
                "method_id": "flat_rate",
                "method_title": "Flat Rate",
                "total": "10.00"
              }
            ]
          }));
      print("response order in  OrderService");
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
        print('created order');
        var result = jsonDecode(response.body);
        print(result['id']);
        print(result['customer_id']);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<List<OrderModel>> getAllOrderById(int customerId) async {
    List<OrderModel> listResult = [];
    try {
      final param = {
        'consumer_key': 'ck_b224bb54e462bfa5adb9f220fe7af19cdf3355ba',
        'consumer_secret': 'cs_95eeec6d48257b3cd5d085c376228d1d5f9bf4eb',
        'customer': '$customerId'
      };
      final response = await http.get(
        Uri.https('martsimple.com', '/wp-json/wc/v3/orders', param),
        headers: {'Content-Type': 'application/json'},
      );
      print("response order in get all order");
      print(response.body);

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        for (var item in result) {
          listResult.add(OrderModel.fromJson(item));
        }
      }

      return listResult;
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
