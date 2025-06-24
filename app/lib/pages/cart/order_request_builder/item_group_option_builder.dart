import '../../../data/request/order_request/order_request.dart';
import 'order_item_request_builder.dart';

class ItemGroupOptionRequestBuilder {
  int _groupOptionId = 0;
  List<ItemOptionRequest> _itemOptions = [];
  double _subTotalPrice = 0.0;

  ItemGroupOptionRequestBuilder();

  ItemGroupOptionRequestBuilder setGroupOptionId(int groupOptionId) {
    _groupOptionId = groupOptionId;
    return this;
  }

  ItemGroupOptionRequestBuilder setItemOptionRequests(List<ItemOptionRequest> itemOptions) {
    _itemOptions = itemOptions;
    return this;
  }

  ItemGroupOptionRequestBuilder addItemOptionRequest(ItemOptionRequest itemOption) {
    _itemOptions.add(itemOption);
    return this;
  }

  ItemGroupOptionRequestBuilder addItemOptionRequests(List<ItemOptionRequest> itemOptions) {
    _itemOptions.addAll(itemOptions);
    return this;
  }

  ItemGroupOptionRequestBuilder setSubTotalPrice(double subTotalPrice) {
    _subTotalPrice = subTotalPrice;
    return this;
  }

  ItemGroupOptionRequest buildItemGroupOptionRequest() {
    return ItemGroupOptionRequest(
        group_option_id: _groupOptionId,
        item_options: _itemOptions,
        sub_total_price: _subTotalPrice);
  }
}
