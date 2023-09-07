import 'package:fashion_app/view/history_order/widget/history_order_body_section.dart';
import 'package:fashion_app/view/widgets/common/custom_appbar.dart';
import 'package:flutter/material.dart';

class HistoryOrderScreen extends StatefulWidget {
  const HistoryOrderScreen({super.key});

  @override
  State<HistoryOrderScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppbar(title: 'Order History'),
        body: HistoryOrderBodySection());
  }
}
