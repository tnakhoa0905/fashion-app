import 'package:fashion_app/config/services/prefs.dart';
import 'package:fashion_app/config/services/service_locator.dart';
import 'package:fashion_app/controllers/order/order_state.dart';
import 'package:fashion_app/data/models/order/order_model.dart';
import 'package:fashion_app/data/remote/firebase_database/firebase_user_service.dart';
import 'package:fashion_app/data/remote/oder/order_service.dart';
import 'package:fashion_app/domain/entities/account/user_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.orderService) : super(OrderInitial());
  final OrderService orderService;

  List<OrderModel> listOrder = [];

  final _prefs = getIt<AppPrefs>();

  getAllOrder() async {
    print('get all order');
    emit(OrderLoading());
    UserApi? userApi =
        await FirebaseUserServiceImpl().getUserProfileById(_prefs.userUid!);
    print('id user');
    print(userApi!.id);
    listOrder.clear();
    listOrder = await orderService.getAllOrderById(userApi.id);
    print(listOrder);
    emit(OrderLoaded());
  }
}
