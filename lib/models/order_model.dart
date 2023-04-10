class OrdersModel {
  OrdersModel({
    required this.orders,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<OrderModel> orders;
  final int total;
  final int skip;
  final int limit;

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      orders: List<OrderModel>.from(
          json['carts'].map((order) => OrderModel.fromJson(order))),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carts'] = orders.map((v) => v.toJson()).toList();
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class OrderModel {
  OrderModel({
    required this.id,
    required this.totalMoney,
    required this.totalProducts,
    required this.totalQuantity,
  });

  final int id;
  final int totalMoney;
  final int totalProducts;
  final int totalQuantity;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      totalMoney: json['total'],
      totalProducts: json['totalProducts'],
      totalQuantity: json['totalQuantity'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total'] = totalMoney;
    data['totalProducts'] = totalProducts;
    data['totalQuantity'] = totalQuantity;
    return data;
  }
}
