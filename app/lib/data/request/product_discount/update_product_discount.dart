class UpdateProductDiscountRequest {
  UpdateProductDiscountRequest({
    required this.id,
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
  });
  int id;
  String name;
  String conditions;
  double discountValue;
  String discountType;
  String discountUnit;
  DateTime validFrom;
  DateTime validTo;
  String couponCode;
  double minimumOrderValue;
  double maximumDiscountValue;
  toJson() {
    return {
      "id": id,
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
    };
  }
}
