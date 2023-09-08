import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fashion_app/controllers/address/address_cubit.dart';
import 'package:fashion_app/controllers/cart/cart_cubit.dart';
import 'package:fashion_app/domain/entities/account/address.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  int currnetPaymentTap = 0;
  int addressCheck = 0;

  onChangePaymentMethod(int index) {
    currnetPaymentTap = index;
    emit(ChangePaymentMethod());
  }

  List<AddressEntity> getSavedAddress(BuildContext context) {
    return BlocProvider.of<AddressCubit>(context).addressList;
  }

  AddressEntity? getSelectedAddress(BuildContext context) {
    final result = getSavedAddress(context);
    if (result.isEmpty) {
      return null;
    }

    return getSavedAddress(context)[addressCheck];
  }

  setAddress(int index) {
    addressCheck = index;
    emit(CheckoutInitial());
  }

  double getPriceSubTotal(BuildContext context) {
    return BlocProvider.of<CartCubit>(context).subTotal();
  }

  List<ProductsInformations> getProductsInformations(BuildContext context) {
    final carts = BlocProvider.of<CartCubit>(context).carts;
    List<ProductsInformations> products = [];
    for (var item in carts.entries) {
      products.add(
        ProductsInformations(
            name: item.key.name,
            count: item.value,
            price: item.key.currentPrice * item.value,
            image: item.key.images.isEmpty
                ? "https://i.pinimg.com/1200x/d9/f8/6e/d9f86e705dc104e812c10873dd004ed5.jpg"
                : item.key.images[0]),
      );
    }

    return products;
  }

  double get getDeliveryFee {
    return 3.00;
  }

  double get getFax {
    return 2.120;
  }

  double getPriceTotal(BuildContext context) {
    return getDeliveryFee + (getPriceSubTotal(context) + getFax);
  }
}

class ProductsInformations {
  final String name;
  final int count;
  final double price;
  final String image;
  ProductsInformations(
      {required this.name,
      required this.count,
      required this.price,
      required this.image});
}
