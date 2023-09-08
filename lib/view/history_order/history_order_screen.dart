import 'package:fashion_app/config/routes/route_context.dart';
import 'package:fashion_app/core/extensions/theme_extension.dart';
import 'package:fashion_app/view/history_order/widget/history_order_body_section.dart';
import 'package:fashion_app/view/widgets/common/custom_appbar.dart';
import 'package:fashion_app/view/widgets/common/text_utils.dart';
import 'package:flutter/material.dart';

class HistoryOrderScreen extends StatefulWidget {
  const HistoryOrderScreen({super.key});

  @override
  State<HistoryOrderScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 240, 240, 240),
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              context.back();
            },
            icon: Icon(Icons.arrow_back_ios, color: context.primaryColor),
          ),
          centerTitle: true,
          title: const TextUtils(
            text: 'Order History',
            fontSize: 20,
            fontWe: FontWe.medium,
          ),
        ),
        body: HistoryOrderBodySection());
  }
}
