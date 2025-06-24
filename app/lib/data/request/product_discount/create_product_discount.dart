class CreateProductDiscountRequest {
  CreateProductDiscountRequest({
    required this.dishId,
    required this.restaurantId,
    required this.name,
    required this.conditions,
    required this.discountValue,
    required this.discountType,
    required this.discountUnit,
    required this.validFrom,
    required this.validTo,
    required this.couponCode,
    required this.minimumOrderValue,
    required this.maximumDiscountValue,
    required this.maxUsed,
  });
  int dishId;
  int restaurantId;
  String name;
  String conditions;
  double discountValue;
  String discountType;
  int discountUnit;
  DateTime validFrom;
  DateTime validTo;
  String couponCode;
  double minimumOrderValue;
  double maximumDiscountValue;
  int maxUsed;
  toJson() {
    return {
      "dishId": dishId,
      "restaurantId": restaurantId,
      "name": name,
      "conditions": conditions,
      "discountValue": discountValue,
      "discountType": discountType,
      "discountUnit": discountUnit,
      "validFrom": validFrom,
      "validTo": validTo,
      "couponCode": couponCode,
      "minimumOrderValue": minimumOrderValue,
      "maximumDiscountValue": maximumDiscountValue,
      "maxUsed": maxUsed,
    };
  }
}
