import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_request.freezed.dart';
part 'order_request.g.dart';

@Freezed()
class OrderRequest with _$OrderRequest {
  const factory OrderRequest({
    required int user_id,
    required double total_price,
    required String address,
    required List<int> voucher_ids,
    required List<OrderItemRequest> order_items,
  }) = _OrderRequest;

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);
}

@freezed
class OrderItemRequest with _$OrderItemRequest {
  const factory OrderItemRequest({
    required int dish_id,
    required int quantity,
    required double item_price,
    required List<ItemGroupOptionRequest> item_group_options,
  }) = _OrderItemRequest;

  factory OrderItemRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderItemRequestFromJson(json);
}

@freezed
class ItemGroupOptionRequest with _$ItemGroupOptionRequest {
  const factory ItemGroupOptionRequest({
    required int group_option_id,
    required List<ItemOptionRequest> item_options,
    required double sub_total_price,
  }) = _ItemGroupOptionRequest;

  factory ItemGroupOptionRequest.fromJson(Map<String, dynamic> json) =>
      _$ItemGroupOptionRequestFromJson(json);
}

@freezed
class ItemOptionRequest with _$ItemOptionRequest {
  const factory ItemOptionRequest({
    required int option_item_id,
    required int quantity,
  }) = _ItemOptionRequest;

  factory ItemOptionRequest.fromJson(Map<String, dynamic> json) =>
      _$ItemOptionRequestFromJson(json);
}

