import 'package:dio/dio.dart';
import 'package:food_delivery_app/common/network/dio_client.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/chat_controller.dart';
import 'package:food_delivery_app/controller/confirm_order_controller.dart';
import 'package:food_delivery_app/controller/dish_controller.dart';
import 'package:food_delivery_app/controller/information_controller.dart';
import 'package:food_delivery_app/controller/discount_manager_controller.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/controller/new_discount_controller.dart';
import 'package:food_delivery_app/controller/new_group_option_controller.dart';
import 'package:food_delivery_app/controller/new_restaurant_controller.dart';
import 'package:food_delivery_app/controller/option_controller.dart';
import 'package:food_delivery_app/controller/order_controller.dart';
import 'package:food_delivery_app/controller/voucher_controller.dart';
import 'package:food_delivery_app/data/api/address/address_api.dart';
import 'package:food_delivery_app/data/api/cart/cart_api.dart';
import 'package:food_delivery_app/data/api/category/category_api.dart';
import 'package:food_delivery_app/data/api/chat/chat_api.dart';
import 'package:food_delivery_app/data/api/discount/discount_api.dart';
import 'package:food_delivery_app/data/api/dish/dish_api.dart';
import 'package:food_delivery_app/data/api/dishType/dish_type_api.dart';
import 'package:food_delivery_app/data/api/groupOption/group_option_api.dart';
import 'package:food_delivery_app/data/api/image-storage/image-storage-api.dart';
import 'package:food_delivery_app/data/api/message/message_api.dart';
import 'package:food_delivery_app/data/api/order/order_api.dart';
import 'package:food_delivery_app/data/api/province/province_api.dart';
import 'package:food_delivery_app/data/api/restaurant/restaurant_api.dart';
import 'package:food_delivery_app/data/api/restaurantOfDish/restaurant_of_dish.dart';
import 'package:food_delivery_app/data/api/user/auth_api.dart';
import 'package:food_delivery_app/data/api/voucher/voucher_api.dart';
import 'package:food_delivery_app/models/auth_controller.dart';
import 'package:food_delivery_app/models/on_boarding_controller.dart';
import 'package:food_delivery_app/pages/cart/confirm_order_page_2.dart';
import 'package:food_delivery_app/pages/discount_manager/new_product_discount.dart';
import 'package:food_delivery_app/repository/address_repository.dart';
import 'package:food_delivery_app/repository/cart_repository.dart';
import 'package:food_delivery_app/repository/category_repository.dart';
import 'package:food_delivery_app/repository/chat_repository.dart';
import 'package:food_delivery_app/repository/discount_repository.dart';
import 'package:food_delivery_app/repository/dish_repository.dart';
import 'package:food_delivery_app/repository/dish_type_repository.dart';
import 'package:food_delivery_app/repository/group_option_repository.dart';
import 'package:food_delivery_app/repository/image_storage_repository.dart';
import 'package:food_delivery_app/repository/menu_repository.dart';
import 'package:food_delivery_app/repository/message_repository.dart';
import 'package:food_delivery_app/repository/order_repository.dart';
import 'package:food_delivery_app/repository/product_discount_repository.dart';
import 'package:food_delivery_app/repository/province_repository.dart';
import 'package:food_delivery_app/repository/restaurant_of_dish_repository.dart';
import 'package:food_delivery_app/repository/restaurant_repository.dart';
import 'package:food_delivery_app/repository/user_repository.dart';
import 'package:food_delivery_app/repository/voucher_repository.dart';
import 'package:food_delivery_app/values/app_config.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/account_controller.dart';
import 'controller/conversation_controller.dart';
import 'controller/menu_controller.dart';
import 'controller/new_dish_controller.dart';
import 'controller/order_manager_controller.dart';
import 'controller/restaurant_manager_controller.dart';
import 'data/api/product_discount/product_discount_api.dart';
import 'data/api/user/user_api.dart';

// class MyBindings extends Bindings {
//   @override
//   void dependencies() {
//     // Sử dụng Get.lazyPut() thay vì Get.put()
//
//     Get.lazyPut(() => CartController(), fenix: true);
//     Get.lazyPut(() => OptionController(), fenix: true);
//     Get.lazyPut(() => LocationController(), fenix: true);
//     //dio
//     Get.lazyPut(() => Dio());
//     Get.lazyPut(() => DioClient(Get.find<Dio>()));
//     //api
//     Get.lazyPut(() => OrderApi(dioClient: Get.find<DioClient>()), fenix: true);
//     Get.lazyPut(() => DishTypeApi(dioClient: Get.find<DioClient>()),
//         fenix: true);
//     Get.lazyPut(() => AddressApi(dioClient: Get.find<DioClient>()),
//         fenix: true);
//     Get.lazyPut(() => RestaurantApi(dioClient: Get.find<DioClient>()),
//         fenix: true);
//     Get.lazyPut(() => DishApi(dioClient: Get.find<DioClient>()), fenix: true);
//     Get.lazyPut(() => GroupOptionApi(dioClient: Get.find<DioClient>()),
//         fenix: true);
//     Get.lazyPut(() => RestaurantOfApi(dioClient: Get.find<DioClient>()),
//         fenix: true);
//     Get.lazyPut(() => CartApi(dioClient: Get.find<DioClient>()), fenix: true);
//     //repos
//     Get.lazyPut(() => UserRepository());
//     Get.lazyPut(() => OrderRepository(orderApi: Get.find<OrderApi>()),
//         fenix: true);
//     Get.lazyPut(() => CartRepository(cartApi: Get.find<CartApi>()),
//         fenix: true);
//     Get.lazyPut(
//         () => RestaurantOfDishRepository(
//             restaurantOfDishApi: Get.find<RestaurantOfApi>()),
//         fenix: true);
//     Get.lazyPut(() => DishTypeRepository(dishTypeApi: Get.find<DishTypeApi>()),
//         fenix: true);
//     Get.lazyPut(() => AddressRepository(addressApi: Get.find<AddressApi>()),
//         fenix: true);
//     Get.lazyPut(
//         () => GroupOptionRepository(groupOptionApi: Get.find<GroupOptionApi>()),
//         fenix: true);
//     Get.lazyPut(() => DishRepository(dishApi: Get.find<DishApi>()),
//         fenix: true);
//     Get.lazyPut(
//         () => RestaurantRepository(restaurantApi: Get.find<RestaurantApi>()),
//         fenix: true);
//     //controllers
//     Get.lazyPut(() => LocationController());
//     Get.lazyPut(() => InformationController(), fenix: true);
//
//     Get.lazyPut(() => AuthController(Get.find<OrderRepository>()));
//     Get.lazyPut(() => OnBoardingController());
//   }
// }
Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences, fenix: true);

  // dio
  Get.lazyPut(() => DioClient(Dio(), Dio(), Dio()), fenix: true);
  // Dio dio = Dio();
  // api
  Get.lazyPut(() => OrderApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => DishTypeApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => AddressApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => RestaurantApi(dioClient: Get.find<DioClient>()),
      fenix: true);
  Get.lazyPut(() => RestaurantOfDishApi(dioClient: Get.find<DioClient>()),
      fenix: true);
  Get.lazyPut(() => DishApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => GroupOptionApi(dioClient: Get.find<DioClient>()),
      fenix: true);
  Get.lazyPut(() => CartApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => ChatApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => MessageApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => AuthApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => UserApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => ProvinceApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => ImageStorageApi(), fenix: true);
  Get.lazyPut(() => CategoryApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => VoucherApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => OrderApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => DiscountApi(dioClient: Get.find<DioClient>()), fenix: true);
  Get.lazyPut(() => ProductDiscountApi(dioClient: Get.find<DioClient>()),
      fenix: true);

  // repos
  Get.lazyPut(
      () => UserRepository(
          authApi: Get.find<AuthApi>(), userApi: Get.find<UserApi>()),
      fenix: true);
  Get.lazyPut(() => OrderRepository(orderApi: Get.find<OrderApi>()),
      fenix: true);
  Get.lazyPut(() => CartRepository(cartApi: Get.find<CartApi>()), fenix: true);
  Get.lazyPut(() => DishTypeRepository(dishTypeApi: Get.find<DishTypeApi>()),
      fenix: true);
  Get.lazyPut(() => AddressRepository(addressApi: Get.find<AddressApi>()),
      fenix: true);
  Get.lazyPut(
      () => GroupOptionRepository(groupOptionApi: Get.find<GroupOptionApi>()),
      fenix: true);
  Get.lazyPut(
      () => DishRepository(
          dishApi: Get.find<DishApi>(), categoryApi: Get.find<CategoryApi>()),
      fenix: true);
  Get.lazyPut(
      () => RestaurantRepository(restaurantApi: Get.find<RestaurantApi>()),
      fenix: true);
  Get.lazyPut(() => ChatRepository(chatApi: Get.find<ChatApi>()), fenix: true);
  Get.lazyPut(() => MessageRepository(messageApi: Get.find<MessageApi>()),
      fenix: true);
  Get.lazyPut(() => ProvinceRepository(provinceApi: Get.find<ProvinceApi>()),
      fenix: true);
  Get.lazyPut(
      () =>
          ImageStorageRepository(imageStorageApi: Get.find<ImageStorageApi>()),
      fenix: true);
  Get.lazyPut(
      () => MenuRepository(
          categoryApi: Get.find<CategoryApi>(),
          dishApi: Get.find<DishApi>(),
          groupOptionApi: Get.find<GroupOptionApi>()),
      fenix: true);
  Get.lazyPut(() => VoucherRepository(voucherApi: Get.find<VoucherApi>()),
      fenix: true);
  Get.lazyPut(
      () => RestaurantOfDishRepository(
          restaurantOfDishApi: Get.find<RestaurantOfDishApi>()),
      fenix: true);
  Get.lazyPut(() => DiscountRepository(discountApi: Get.find<DiscountApi>()),
      fenix: true);
  Get.lazyPut(
      () => ProductDiscountRepository(
          productDiscountApi: Get.find<ProductDiscountApi>()),
      fenix: true);
  Get.lazyPut(() => CategoryRepository(categoryApi: Get.find<CategoryApi>()),
      fenix: true);

  // controllers
  Get.lazyPut(() => LocationController(), fenix: true);
  Get.lazyPut(() => CartController(), fenix: true);
  Get.lazyPut(() => OptionController(), fenix: true);
  Get.lazyPut(() => AuthController(Get.find<UserRepository>()), fenix: true);
  Get.lazyPut(() => OnBoardingController(), fenix: true);
  Get.lazyPut(
      () => ChatController(
          messageRepository: Get.find<MessageRepository>(),
          chatRepository: Get.find<ChatRepository>()),
      fenix: true);
  Get.lazyPut(
      () => NewRestaurantController(
            imageStorageRepository: Get.find<ImageStorageRepository>(),
            provinceRepository: Get.find<ProvinceRepository>(),
            restaurantRepository: Get.find<RestaurantRepository>(),
            categoryRepository: Get.find<CategoryRepository>(),
          ),
      fenix: true);
  Get.lazyPut(
      () => NewDishController(
          imageStorageRepository: Get.find<ImageStorageRepository>(),
          dishRepository: Get.find<DishRepository>()),
      fenix: true);
  Get.lazyPut(
      () => MenuRestaurantController(
          menuRepository: Get.find<MenuRepository>(),
          discountRepository: Get.find<ProductDiscountRepository>(),
          restaurantRepository: Get.find<RestaurantRepository>()),
      fenix: true);
  Get.lazyPut(
      () =>
          OrderManagerController(orderRepository: Get.find<OrderRepository>()),
      fenix: true);
  Get.lazyPut(
      () => RestaurantManagerController(
          restaurantRepository: Get.find<RestaurantRepository>()),
      fenix: true);
  Get.lazyPut(
      () => AccountController(
          restaurantRepository: Get.find<RestaurantRepository>(),
          userRepository: Get.find<UserRepository>()),
      fenix: true);
  Get.lazyPut(
      () => VoucherController(
          voucherRepository: Get.find<VoucherRepository>(),
          productDiscountRepository: Get.find<ProductDiscountRepository>()),
      fenix: true);
  Get.lazyPut(
      () => ProductDiscountController(
          productDiscountRepository: Get.find<ProductDiscountRepository>()),
      fenix: true);
  Get.lazyPut(
      () => NewProductDiscountController(
          productDiscountRepository: Get.find<ProductDiscountRepository>(),
          dishRepository: Get.find<DishRepository>()),
      fenix: true);
  Get.lazyPut(
      () => ConversationController(
          chatRepository: Get.find<ChatRepository>(),
          userRepository: Get.find<UserRepository>()),
      fenix: true);
  Get.lazyPut(() => InformationController(), fenix: true);
  Get.lazyPut(() => DishController(), fenix: true);
  Get.lazyPut(() => OrderController(), fenix: true);
  Get.lazyPut(() => NewGroupOptionController(), fenix: true);
  Get.lazyPut(() => ConfirmOrderController(), fenix: true);
}
