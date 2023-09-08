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
    return Container(
      margin: const EdgeInsets.only(top: 10),
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
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(width: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                        'Order in ${DateFormat('yyyy-MM-dd').format(listOrder[index].dateCreated!)}',
                                    fontSize: 16,
                                    maxlines: 2,
                                    fontWe: FontWe.medium,
                                  ),
                                  const Spacer(),
                                  TextUtils(
                                    text:
                                        '${listOrder[index].status!.toUpperCase()}',
                                    fontSize: 12,
                                    maxlines: 2,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              listOrder[index].lineItems!.isNotEmpty
                                  ? ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:
                                          listOrder[index].lineItems!.length,
                                      itemBuilder: (context, idx) {
                                        return Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 40,
                                                  height: 40,
                                                  child: Image.network(
                                                    listOrder[index]
                                                                .lineItems![idx]
                                                                .image!
                                                                .src ==
                                                            ""
                                                        ? "https://i.pinimg.com/1200x/d9/f8/6e/d9f86e705dc104e812c10873dd004ed5.jpg"
                                                        : listOrder[index]
                                                            .lineItems![idx]
                                                            .image!
                                                            .src!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextUtils(
                                                        text:
                                                            '${listOrder[index].lineItems![idx].name}',
                                                        fontSize: 12,
                                                        maxlines: 1,
                                                        color: Theme.of(context)
                                                            .primaryColorLight,
                                                      ),
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      Row(
                                                        children: [
                                                          TextUtils(
                                                            text: listOrder[index]
                                                                        .lineItems![
                                                                            idx]
                                                                        .price ==
                                                                    ""
                                                                ? "10"
                                                                : '${listOrder[index].lineItems![idx].price}',
                                                            fontSize: 12,
                                                            maxlines: 1,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColorLight,
                                                          ),
                                                          TextUtils(
                                                            text: 'x',
                                                            fontSize: 12,
                                                            maxlines: 1,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColorLight,
                                                          ),
                                                          TextUtils(
                                                            text:
                                                                '${listOrder[index].lineItems![idx].quantity}',
                                                            fontSize: 12,
                                                            maxlines: 1,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColorLight,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                              height: 2,
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            )
                                          ],
                                        );
                                      })
                                  : Container(),
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
                        const SizedBox(width: 15),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
