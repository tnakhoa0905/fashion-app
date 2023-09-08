import 'package:fashion_app/controllers/checkout/checkout_cubit.dart';
import 'package:fashion_app/core/utils/colors.dart';
import 'package:fashion_app/core/utils/strings.dart';
import 'package:fashion_app/core/utils/values.dart';
import 'package:fashion_app/view/widgets/common/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductInfromationSection extends StatelessWidget {
  const ProductInfromationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
          child: TextUtils(
            text: AppStrings.productsInformation,
            fontSize: 18,
            fontWe: FontWe.medium,
          ),
        ),
        const SizedBox(height: AppSizes.s10),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                      text: "Image",
                      color: AppColor.gray,
                      fontSize: 12,
                    ),
                    TextUtils(
                      text: AppStrings.productName,
                      color: AppColor.gray,
                      fontSize: 12,
                    ),
                    TextUtils(
                      text: AppStrings.count,
                      color: AppColor.gray,
                      fontSize: 12,
                    ),
                    TextUtils(
                      text: AppStrings.price,
                      color: AppColor.gray,
                      fontSize: 12,
                    ),
                  ],
                ),
                ..._generateProductsInformationList(context),
              ],
            ),
          ),
        )
      ],
    );
  }
}

List<Widget> _generateProductsInformationList(BuildContext context) {
  List<ProductsInformations> products =
      BlocProvider.of<CheckoutCubit>(context).getProductsInformations(context);

  return List.generate(
    products.length,
    (index) {
      return _productInfromation(
          name: products[index].name,
          count: products[index].count,
          price: products[index].price,
          image: products[index].image);
    },
  );
}

Padding _productInfromation(
    {required String name,
    required int count,
    required double price,
    required String image}) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 100,
          child: TextUtils(
            text: name.substring(22),
            fontSize: 14,
            tr: false,
            maxlines: 1,
          ),
        ),
        TextUtils(
          text: "$count",
          fontSize: 14,
          tr: false,
        ),
        TextUtils(
          text: "$price",
          fontSize: 14,
          tr: false,
        ),
      ],
    ),
  );
}
