import 'package:food_delivery_app/data/model/cartItem/cart_item.dart';

import '../../../data/model/dish/dish.dart';
import '../../../data/request/order_request/order_request.dart';
import 'item_group_option_builder.dart';
import 'order_request_builder.dart';

class OrderItemRequestBuilder {
  int _dishId = 0;
  int _quantity = 0;
  double _price = 0;
  double _subTotalPrice = 0.0;
  List<ItemGroupOptionRequest> _itemGroupOptions = [];

  OrderItemRequestBuilder();

  OrderItemRequestBuilder setDish(Dish dish) {
    _dishId = dish.id;
    _price = dish.price;
    return this;
  }

  OrderItemRequestBuilder setQuantity(int quantity) {
    _quantity = quantity;
    return this;
  }

  OrderItemRequestBuilder addItemGroupOption(ItemGroupOptionRequest itemGroupOption) {
    _itemGroupOptions.add(itemGroupOption);
    return this;
  }

  OrderItemRequestBuilder addItemGroupOptions(List<ItemGroupOptionRequest> itemGroupOptions) {
    _itemGroupOptions.addAll(itemGroupOptions);
    return this;
  }
  OrderItemRequestBuilder buildFromCartItems(CartItem item){
    setDish(item.dish!);
    setQuantity(item.quantity);
    item.itemCartGroupOptions.forEach((element) {
      ItemGroupOptionRequestBuilder()
          .setGroupOptionId(element.groupOption!.id)
          .setSubTotalPrice(element.cartItemOptions.fold(
              0, (previousValue, element) => previousValue + element.price * element.quantity))
          .setItemOptionRequests(element.cartItemOptions.map((e) => ItemOptionRequest(option_item_id: e.optionItem!.id, quantity: e.quantity)).toList())
          .buildItemGroupOptionRequest();
    });
    _subTotalPrice = _quantity * _price + _itemGroupOptions.fold(0, (previousValue, element) => previousValue + element.sub_total_price);
    return this;
  }
  OrderItemRequest buildOrderItem() {
    return OrderItemRequest(
      dish_id: _dishId,
      quantity: _quantity,
      item_group_options: _itemGroupOptions,
      item_price: _subTotalPrice,
    );
  }
}
