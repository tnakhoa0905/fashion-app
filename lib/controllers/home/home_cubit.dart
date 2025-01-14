import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fashion_app/core/errors/exceptions.dart';

import 'package:fashion_app/domain/entities/product/product_category.dart';
import 'package:fashion_app/domain/entities/product/product_entity.dart';

import 'package:fashion_app/domain/usecases/home/get_home_products_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._usecase) : super(HomeInitial());

  final GetHomeProductsUsecase _usecase;

  int offset = 0;

  List<ProductEntity> art = [];
  List<ProductEntity> gift = [];
  List<ProductEntity> accessories = [];
  List<ProductEntity> womenJeans = [];
  List<ProductEntity> menShorts = [];
  List<ProductEntity> menShoesAndSneakers = [];
  List<ProductEntity> tShirtsAndTankTops = [];
  List<ProductEntity> womenTops = [];
  List<ProductEntity> womenShoes = [];

  Future<void> onRefresh() async {
    await getHomeProdcuts();
  }

  getHomeProdcuts() async {
    emit(HomeProductLoading());
    try {
      await _getProductByCategory(MenCategory.art);
      await _getProductByCategory(MenCategory.gift);
      await _getProductByCategory(MenCategory.accessories);
      // await _getProductByCategory(WomenCategory.jeans);
      // await _getProductByCategory(WomenCategory.tops);
      // await _getProductByCategory(WomenCategory.shoes);
      // await _getProductByCategory(MenCategory.shoesAndSneakers);
      // await _getProductByCategory(MenCategory.shorts);
      // await _getProductByCategory(MenCategory.tShirtsAndTankTops);
      emit(HomeProductLoaded());
    } on ServerException catch (e) {
      emit(HomeProductsFailure(e.message));
    }
  }

  int _generateRandomNumber() {
    return Random().nextInt(32);
  }

  List<ProductEntity> prodcutsList(int categoryId) {
    switch (categoryId) {
      case MenCategory.art:
        return art;
      case MenCategory.gift:
        return gift;
      case MenCategory.accessories:
        return accessories;
      // case WomenCategory.jeans:
      //   return womenJeans;
      // case MenCategory.shorts:
      //   return menShorts;
      // case MenCategory.shoesAndSneakers:
      //   return menShoesAndSneakers;
      // case MenCategory.tShirtsAndTankTops:
      //   return tShirtsAndTankTops;
      // case WomenCategory.shoes:
      //   return womenShoes;
      // case WomenCategory.tops:
      //   return womenTops;

      default:
        return [];
    }
  }

  _getProductByCategory(int categoryID) async {
    offset = _generateRandomNumber();

    (await _usecase.call(HomeProductsInputs(categoryID, offset))).fold(
      (failure) {
        throw ServerException(message: failure.message);
      },
      (products) {
        switch (categoryID) {
          case MenCategory.art:
            art = products;
            break;
          case MenCategory.gift:
            gift = products;
            break;
          case MenCategory.accessories:
            accessories = products;
            break;
          // case WomenCategory.jeans:
          //   womenJeans = products;
          //   break;
          // case MenCategory.shorts:
          //   menShorts = products;
          //   break;
          // case MenCategory.shoesAndSneakers:
          //   menShoesAndSneakers = products;
          //   break;
          // case MenCategory.tShirtsAndTankTops:
          //   tShirtsAndTankTops = products;
          //   break;
          // case WomenCategory.shoes:
          //   womenShoes = products;
          //   break;
          // case WomenCategory.tops:
          //   womenTops = products;
          //   break;
          default:
            art = products;
        }
      },
    );
  }
}
