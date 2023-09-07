import 'package:easy_localization/easy_localization.dart';
import 'package:fashion_app/controllers/order/order_cubit.dart';
import 'package:fashion_app/core/utils/values.dart';
import 'package:fashion_app/view/history_order_detail/history_order_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:fashion_app/view/widgets/common/text_utils.dart';
import 'package:fashion_app/core/extensions/media_query_extension.dart';
import 'package:fashion_app/core/utils/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryOrderListView extends StatelessWidget {
  const HistoryOrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    final listOrder = BlocProvider.of<OrderCubit>(context).listOrder;
    // TODO: implement build
    return SizedBox(
      height: context.setHeight(1),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: listOrder.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HistoryOrderDetail(
                          orderModel: listOrder[index],
                        )),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p20, vertical: AppPadding.p5),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   width: 80,
                      //   height: 100,
                      //   decoration: BoxDecoration(
                      //     color: AppColor.white2,
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: AspectRatio(
                      //     aspectRatio: 1 / 3,
                      //     child: Image.network(
                      //       "https://i.pinimg.com/1200x/d9/f8/6e/d9f86e705dc104e812c10873dd004ed5.jpg",
                      //       fit: BoxFit.fill,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextUtils(
                                  text:
                                      'Order in ${DateFormat('yyyy-MM-dd – kk:mm').format(listOrder[index].dateCreated!)}',
                                  fontSize: 14,
                                  maxlines: 2,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  width: context.setWidth(0.8),
                                  child: TextUtils(
                                    text: 'Price: ${listOrder[index].total}',
                                    fontSize: 16,
                                    fontWe: FontWe.medium,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Divider(
                    height: 2,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
