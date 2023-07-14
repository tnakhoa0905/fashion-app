import 'package:flutter/material.dart';

import 'package:fashion_app/core/extensions/theme_extension.dart';
import 'package:fashion_app/core/utils/colors.dart';
import 'package:fashion_app/view/widgets/common/custom_appbar.dart';
import 'package:fashion_app/view/widgets/common/text_utils.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "Order Detail"),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _orderInfromation(label: "Order Id", value: "465456556"),
              _orderInfromation(label: "Order date", value: "7/9/2023"),
              _orderInfromation(label: "Payment Method", value: "Visa"),
              _orderInfromation(label: "Address", value: "22, raya st"),
            ],
          ),
          const SizedBox(height: 10),
          Divider(
            color: context.primaryColor,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextUtils(
                  text: "Product Name", color: AppColor.gray, fontSize: 12),
              TextUtils(text: "count", color: AppColor.gray, fontSize: 12),
              TextUtils(text: "price", color: AppColor.gray, fontSize: 12),
            ],
          ),
          _productInfromation(
              name: 'T-Shirts Vav besie', count: 2, price: 120.56),
          _productInfromation(
              name: 'T-Shirts Vav besie', count: 2, price: 120.56),
          _productInfromation(
              name: 'T-Shirts Vav besie', count: 2, price: 120.56),
          const SizedBox(height: 10),
          Divider(
            color: context.primaryColor,
          ),
          const Column(
            children: [
              Row(
                children: [
                  TextUtils(text: "subTotal", fontSize: 14),
                  Spacer(),
                  TextUtils(text: "\$${5545}", fontSize: 14),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

Row _productInfromation(
    {required String name, required int count, required double price}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextUtils(text: name, fontSize: 14),
      TextUtils(text: "$count", fontSize: 14),
      TextUtils(text: "$price", fontSize: 14),
    ],
  );
}

Column _orderInfromation({required String label, required String value}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextUtils(
        text: label,
        fontSize: 12,
        color: AppColor.gray,
      ),
      const SizedBox(
        height: 5,
      ),
      TextUtils(
        text: value,
        fontSize: 14,
        maxlines: 1,
      ),
    ],
  );
}