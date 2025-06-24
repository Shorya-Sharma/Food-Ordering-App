enum OrderStatus { PENDING, PROCESSING, DELIVERING, DELIVERED, CANCELED }

class OrderStatusType {
  OrderStatus name;
  String title;
  OrderStatusType({required this.name, required this.title});
  static String getStringName(OrderStatus status) {
    return status.toString().split('.').last;
  }
}
