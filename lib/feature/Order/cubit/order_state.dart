part of 'order_cubit.dart';

class OrderState {
  final Status orderStatus;
  final Status orderDetailsStatus;
  final  String callback;

  OrderState({
    this.orderStatus = Status.initial,
      this.orderDetailsStatus = Status.initial,
    this.callback = '',
  });

  OrderState copyWith({
    Status? orderStatus,
    Status? orderDetailsStatus,
    String? callback,
  }) =>
      OrderState(
        orderStatus: orderStatus ?? this.orderStatus,
        orderDetailsStatus: orderDetailsStatus ?? this.orderDetailsStatus,
        callback: callback ?? this.callback,
      );
}


