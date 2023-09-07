import 'package:fashion_app/core/extensions/media_query_extension.dart';
import 'package:fashion_app/core/utils/colors.dart';
import 'package:fashion_app/core/utils/values.dart';
import 'package:fashion_app/data/models/order/order_model.dart';
import 'package:fashion_app/view/widgets/common/text_utils.dart';
import 'package:flutter/material.dart';

class HistoryOrderDetailBodySection extends StatelessWidget {
  const HistoryOrderDetailBodySection({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    if (orderModel.lineItems!.isEmpty) {
      return Center(child: Text('empty'));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price
        SizedBox(
          width: context.setWidth(0.8),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p20, vertical: AppPadding.p5),
            child: TextUtils(
              text: 'Price: ${orderModel.total}',
              fontSize: 16,
              fontWe: FontWe.medium,
            ),
          ),
        ),
        //List product

        SizedBox(
          // height: context.setHeight(1),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: orderModel.lineItems!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20, vertical: AppPadding.p5),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColor.white2,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1 / 3,
                            child: Image.network(
                              orderModel.lineItems![index].image!.src == ""
                                  ? "https://i.pinimg.com/1200x/d9/f8/6e/d9f86e705dc104e812c10873dd004ed5.jpg"
                                  : orderModel.lineItems![index].image!.src!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
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
                                    text: 'Order in ',
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
                                    width: context.setWidth(0.4),
                                    child: TextUtils(
                                      text:
                                          'Price: ${orderModel.lineItems![index].price} x ${orderModel.lineItems![index].quantity}',
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
              );
            },
          ),
        )
      ],
    );
  }
}
