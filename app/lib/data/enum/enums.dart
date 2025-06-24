enum MessageType {
  text,
  images,
  location;

  @override
  String toString() {
    super.toString();
    return super.toString().split('.').last;
  }

  static MessageType parse(String value) {
    for (MessageType type in MessageType.values) {
      if (type.toString() == value) {
        return type;
      }
    }
    throw Exception("Can't parse MessageType! Your input value is \"$value\"");
  }
}

enum RestaurantTypeEnum {
  fastfood,
  restaurant,
  cafe,
  bar,
  pub,
  bakery,
  foodcourt,
  foodtruck;

  @override
  String toString() {
    super.toString();
    return super.toString().split('.').last;
  }

  static MessageType parse(String value) {
    for (MessageType type in MessageType.values) {
      if (type.toString() == value) {
        return type;
      }
    }
    throw Exception(
        "Can't parse RestaurantType! Your input value is \"$value\"");
  }
}

enum DiscountType {
  percentage,
  amount;

  @override
  String toString() {
    super.toString();
    return super.toString().split('.').last;
  }

  static MessageType parse(String value) {
    for (MessageType type in MessageType.values) {
      if (type.toString() == value) {
        return type;
      }
    }
    throw Exception(
        "Can't parse RestaurantType! Your input value is \"$value\"");
  }
}
enum PaymentStatus {
  CANCELED,
  PAID,
  SUCCESS,
  FAILED;

  @override
  String toString() {
    super.toString();
    return super.toString().split('.').last;
  }
}
enum PaymentMethod {
  CASH,
  ZALO_PAY,
  VN_PAY;

  @override
  String toString() {
    super.toString();
    return super.toString().split('.').last;
  }
}
