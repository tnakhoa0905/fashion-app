import 'package:fashion_app/controllers/order/order_cubit.dart';
import 'package:fashion_app/controllers/order/order_state.dart';
import 'package:fashion_app/view/history_order/widget/history_order_listview.dart';
import 'package:fashion_app/view/widgets/state_renderer/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryOrderBodySection extends StatelessWidget {
  const HistoryOrderBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(builder: (context, state) {
      if (state is OrderLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is OrderLoaded) {
        if (BlocProvider.of<OrderCubit>(context).listOrder.isEmpty) {
          return const EmptyState(
              icon: Icons.shopping_basket, message: 'Your Order Is Empty');
        }
        return const HistoryOrderListView();
      }
      return const Center(
        child: Text('Something when wrong'),
      );
    });
  }
}
