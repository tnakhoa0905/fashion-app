import 'package:easy_localization/easy_localization.dart';
import 'package:fashion_app/config/routes/route_context.dart';
import 'package:fashion_app/core/extensions/theme_extension.dart';
import 'package:fashion_app/data/models/order/order_model.dart';
import 'package:fashion_app/view/history_order_detail/widget/history_order_detail_body_section.dart';
import 'package:fashion_app/view/widgets/common/custom_appbar.dart';
import 'package:fashion_app/view/widgets/common/text_utils.dart';
import 'package:flutter/material.dart';

class HistoryOrderDetail extends StatelessWidget {
  const HistoryOrderDetail({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              context.back();
            },
            icon: Icon(Icons.arrow_back_ios, color: context.primaryColor),
          ),
          centerTitle: true,
          title: Column(
            children: [
              const TextUtils(
                text: 'Order',
                fontSize: 20,
                fontWe: FontWe.medium,
              ),
              TextUtils(
                text: DateFormat('yyyy-MM-dd – kk:mm')
                    .format(orderModel.dateCreated!),
                fontSize: 20,
                fontWe: FontWe.medium,
              ),
            ],
          ),
        ),
        body: HistoryOrderDetailBodySection(orderModel: orderModel));
  }
}
