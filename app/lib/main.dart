import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/pages/account/account_page.dart';
import 'package:food_delivery_app/pages/admin/admin_page.dart';
import 'package:food_delivery_app/pages/auth/login_page.dart';
import 'package:food_delivery_app/pages/auth/sign_up_page.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/pages/chat/chat_screen.dart';
import 'package:food_delivery_app/pages/discount/add_discount_page.dart';
import 'package:food_delivery_app/pages/discount/discount_page.dart';
import 'package:food_delivery_app/pages/conversations/conversation_page.dart';
import 'package:food_delivery_app/pages/discount_manager/new_product_discount.dart';
import 'package:food_delivery_app/pages/food/detail_food_page.dart';
import 'package:food_delivery_app/pages/home/navigation_home.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/location/add_location_page.dart';
import 'package:food_delivery_app/pages/location/location_page.dart';
import 'package:food_delivery_app/pages/location/saved_location_page.dart';
import 'package:food_delivery_app/pages/location/search_location_page.dart';
import 'package:food_delivery_app/pages/map_page.dart';
import 'package:food_delivery_app/pages/menu/menu_restaurant_page.dart';
import 'package:food_delivery_app/pages/my_order/my_order_page.dart';
import 'package:food_delivery_app/pages/my_restaurant/my_restaurant.dart';
import 'package:food_delivery_app/pages/new_food/new_food_page.dart';
import 'package:food_delivery_app/pages/new_restaurant/new_restaurant_page.dart';
import 'package:food_delivery_app/pages/new_restaurant/restaurant_address_page.dart';
import 'package:food_delivery_app/pages/onboarding/on_boaring_page.dart';
import 'package:food_delivery_app/pages/order_detail_manager/order_detail_manager_page.dart';
import 'package:food_delivery_app/pages/order_manager/order_manager.dart';
import 'package:food_delivery_app/pages/payment.dart';
import 'package:food_delivery_app/pages/profile/profile_page.dart';
import 'package:food_delivery_app/pages/restaurant/detail_restaurant_page.dart';
import 'package:food_delivery_app/pages/restaurant_manager/restaurant_manager_page.dart';
import 'package:food_delivery_app/pages/restaurant_manager/restaurant_manager_page2.dart';
import 'package:food_delivery_app/pages/reviews/reviews_page.dart';
import 'package:food_delivery_app/pages/search/search_page.dart';
import 'package:food_delivery_app/pages/search/search_result_page.dart';
import 'package:food_delivery_app/pages/splash_page.dart';
import 'package:food_delivery_app/pages/statistic/statistic_page.dart';
import 'package:food_delivery_app/pages/voucher/my_voucher_page.dart';
import 'package:food_delivery_app/pages/voucher/voucher_detail_page.dart';
import 'package:food_delivery_app/resources/components/custom_expand_panel.dart';
import 'package:food_delivery_app/routes.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_config.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:food_delivery_app/pages/my_order/tracking_order_page.dart';
import 'di.dart' as dependencyInjection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection.init();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? "",
    anonKey: dotenv.env['SUPABASE_ANON_KEY'] ?? "",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.loginPage,
          getPages: [
            GetPage(
                name: Routes.homePages,
                page: () => HomePage(),
                transition: Transition.leftToRight),
            GetPage(name: Routes.searchPage, page: () => SearchPage()),
            GetPage(name: Routes.locationPage, page: () => LocationPage()),
            GetPage(
                name: Routes.searchResultPage, page: () => SearchResultPage()),
            GetPage(name: Routes.mapPage, page: () => MapPage()),
            GetPage(name: Routes.addLocation, page: () => AddLocationPage()),
            GetPage(
                name: Routes.searchLocation, page: () => SearchLocationPage()),
            GetPage(name: Routes.saveLocation, page: () => SaveLocationPage()),
            GetPage(name: Routes.detailFood, page: () => DetailFoodPage()),
            GetPage(
                name: Routes.detailRestaurant,
                page: () => DetailRestaurantPage()),
            GetPage(name: Routes.chat, page: () => ChatScreen()),
            GetPage(name: Routes.myOrder, page: () => MyOrderPage()),
            GetPage(name: Routes.onBoardingPage, page: () => OnBoardingPage()),
            GetPage(name: Routes.signUp, page: () => SignUpPage()),
            GetPage(name: Routes.loginPage, page: () => LoginPage()),
            GetPage(
                name: Routes.homePages,
                page: () => HomePage(),
                transition: Transition.leftToRight),
            GetPage(name: Routes.dashBoard, page: () => Dashboard()),
            GetPage(name: Routes.splashPages, page: () => SplashPage()),
            GetPage(name: Routes.searchPage, page: () => SearchPage()),
            GetPage(name: Routes.locationPage, page: () => LocationPage()),
            GetPage(
                name: Routes.searchResultPage, page: () => SearchResultPage()),
            GetPage(name: Routes.mapPage, page: () => MapPage()),
            GetPage(name: Routes.addLocation, page: () => AddLocationPage()),
            GetPage(
                name: Routes.searchLocation, page: () => SearchLocationPage()),
            GetPage(name: Routes.saveLocation, page: () => SaveLocationPage()),
            GetPage(name: Routes.detailFood, page: () => DetailFoodPage()),
            GetPage(
                name: Routes.detailRestaurant,
                page: () => DetailRestaurantPage()),
            GetPage(name: Routes.chat, page: () => ChatScreen()),
            GetPage(name: Routes.myOrder, page: () => MyOrderPage()),
            GetPage(
                name: Routes.newRestaurant, page: () => NewRestaurantPage()),
            GetPage(name: Routes.address, page: () => AddressScreen()),
            GetPage(name: Routes.newFood, page: () => NewFoodPage()),
            GetPage(name: "/expand", page: () => CustomExpandPanel()),
            GetPage(name: Routes.dashBoard, page: () => Dashboard()),
            GetPage(name: Routes.splashPages, page: () => SplashPage()),
            GetPage(name: Routes.searchPage, page: () => SearchPage()),
            GetPage(name: Routes.locationPage, page: () => LocationPage()),
            GetPage(
                name: Routes.searchResultPage, page: () => SearchResultPage()),
            GetPage(name: Routes.mapPage, page: () => MapPage()),
            GetPage(name: Routes.addLocation, page: () => AddLocationPage()),
            GetPage(
                name: Routes.searchLocation, page: () => SearchLocationPage()),
            GetPage(name: Routes.saveLocation, page: () => SaveLocationPage()),
            GetPage(name: Routes.detailFood, page: () => DetailFoodPage()),
            GetPage(
                name: Routes.detailRestaurant,
                page: () => DetailRestaurantPage()),
            GetPage(name: Routes.cart, page: () => CartPage()),
            GetPage(name: Routes.myOrder, page: () => MyOrderPage()),
            GetPage(name: Routes.navigationHome, page: () => NavigationHome()),
            GetPage(name: Routes.admin, page: () => AdminNavigationHome()),
            GetPage(
                name: Routes.orderManager, page: () => OrderManagementScreen()),
            GetPage(
                name: Routes.restaurantManager,
                page: () => RestaurantManagerPage(
                      restaurantId: Get.arguments['restaurantId'],
                    )),
            GetPage(name: Routes.account, page: () => AccountScreen()),
            GetPage(name: Routes.profile, page: () => MyProfileScreen()),
            GetPage(name: Routes.myRestaurant, page: () => MyRestaurants()),
            GetPage(
                name: Routes.orderDetailManager,
                page: () => OrderDetailMangerPage()),
            GetPage(name: Routes.myVoucher, page: () => MyVoucherPage()),
            GetPage(
                name: Routes.voucherDetail, page: () => VoucherDetailPage()),
            GetPage(
                name: Routes.newDiscount, page: () => NewProductDiscountPage()),
            GetPage(
                name: Routes.conversation, page: () => ConversationScreen()),
            GetPage(
                name: Routes.voucherDetail, page: () => VoucherDetailPage()),
            GetPage(name: Routes.addDiscount, page: () => AddDiscountPage()),
            GetPage(name: Routes.discounts, page: () => DiscountPage()),
            GetPage(name: Routes.statistic, page: () => StatisticPage()),
            GetPage(name: Routes.reviews, page: () => ReviewsScreen()),
            // GetPage(
            //     name: Routes.discountDetail,
            //     page: () => RestaurantManagerPage2()),
          ],
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
            ),
            fontFamily: 'Sen',
            useMaterial3: true,
          ),
        ));

//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       initialRoute: Routes.goal,
//       initialBinding: MyBindings(),
//       getPages: [
//         GetPage(
//             name: Routes.homePages,
//             page: () => HomePage(),
//             transition: Transition.leftToRight),
//         GetPage(name: Routes.dashBoard, page: () => Dashboard()),
//         GetPage(name: Routes.splashPages, page: () => SplashPage()),
//         GetPage(name: Routes.searchPage, page: () => SearchPage()),
//         GetPage(name: Routes.locationPage, page: () => LocationPage()),
//         GetPage(name: Routes.searchResultPage, page: () => SearchResultPage()),
//         GetPage(name: Routes.mapPage, page: () => MapPage()),
//         GetPage(name: Routes.addLocation, page: () => AddLocationPage()),
//         GetPage(name: Routes.searchLocation, page: () => SearchLocationPage()),
//         GetPage(name: Routes.saveLocation, page: () => SaveLocationPage()),
//         GetPage(name: Routes.detailFood, page: () => DetailFoodPage()),
//         GetPage(
//             name: Routes.detailRestaurant, page: () => DetailRestaurantPage()),
//         GetPage(name: Routes.cart, page: () => CartPage()),
//         GetPage(name: Routes.myOrder, page: () => MyOrderPage()),
//         GetPage(name: Routes.navigationHome, page: () => NavigationHome()),
//         GetPage(name: Routes.goal, page: () => GoalScreen()),
//       ],
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//
//         colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
//         fontFamily: 'Sen',
//         useMaterial3: true,
//       ),
//     );
// >>>>>>>>> Temporary merge branch 2
  }
}
// Future<void> init() async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   Get.lazyPut(() => sharedPreferences, fenix: true);
//
//   // dio
//   Get.lazyPut(() => Dio(), fenix: true);
//   DioClient dioClient = DioClient(Dio(), Dio(), Dio());
//   // Get.lazyPut(() => DioClient(Dio(), Dio(), Dio()), fenix: true);
//   // Dio dio = Dio();
//   // api
//   Get.lazyPut(() => OrderApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => DishTypeApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => AddressApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => RestaurantApi(dioClient: Get.find<DioClient>()),
//       fenix: true);
//   Get.lazyPut(() => RestaurantOfDishApi(dioClient: Get.find<DioClient>()),
//       fenix: true);
//   Get.lazyPut(() => DishApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => GroupOptionApi(dioClient: Get.find<DioClient>()),
//       fenix: true);
//   Get.lazyPut(() => CartApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => ChatApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => MessageApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => AuthApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => UserApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => ProvinceApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => ImageStorageApi(), fenix: true);
//   Get.lazyPut(() => CategoryApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => VoucherApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => OrderApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => DiscountApi(dioClient: Get.find<DioClient>()), fenix: true);
//   Get.lazyPut(() => ProductDiscountApi(dioClient: Get.find<DioClient>()),
//       fenix: true);
//
//   // repos
//   Get.lazyPut(
//           () => UserRepository(
//           authApi: Get.find<AuthApi>(), userApi: Get.find<UserApi>()),
//       fenix: true);
//   Get.lazyPut(() => OrderRepository(orderApi: Get.find<OrderApi>()),
//       fenix: true);
//   Get.lazyPut(() => CartRepository(cartApi: Get.find<CartApi>()), fenix: true);
//   Get.lazyPut(() => DishTypeRepository(dishTypeApi: Get.find<DishTypeApi>()),
//       fenix: true);
//   Get.lazyPut(() => AddressRepository(addressApi: Get.find<AddressApi>()),
//       fenix: true);
//   Get.lazyPut(
//           () => GroupOptionRepository(groupOptionApi: Get.find<GroupOptionApi>()),
//       fenix: true);
//   Get.lazyPut(
//           () => DishRepository(
//           dishApi: Get.find<DishApi>(), categoryApi: Get.find<CategoryApi>()),
//       fenix: true);
//   Get.lazyPut(
//           () => RestaurantRepository(restaurantApi: Get.find<RestaurantApi>()),
//       fenix: true);
//   Get.lazyPut(() => ChatRepository(chatApi: Get.find<ChatApi>()), fenix: true);
//   Get.lazyPut(() => MessageRepository(messageApi: Get.find<MessageApi>()),
//       fenix: true);
//   Get.lazyPut(() => ProvinceRepository(provinceApi: Get.find<ProvinceApi>()),
//       fenix: true);
//   Get.lazyPut(
//           () =>
//           ImageStorageRepository(imageStorageApi: Get.find<ImageStorageApi>()),
//       fenix: true);
//   Get.lazyPut(
//           () => MenuRepository(
//           categoryApi: Get.find<CategoryApi>(),
//           dishApi: Get.find<DishApi>(),
//           groupOptionApi: Get.find<GroupOptionApi>()),
//       fenix: true);
//   Get.lazyPut(() => VoucherRepository(voucherApi: Get.find<VoucherApi>()),
//       fenix: true);
//   Get.lazyPut(
//           () => RestaurantOfDishRepository(
//           restaurantOfDishApi: Get.find<RestaurantOfDishApi>()),
//       fenix: true);
//   Get.lazyPut(() => DiscountRepository(discountApi: Get.find<DiscountApi>()),
//       fenix: true);
//   Get.lazyPut(
//           () => ProductDiscountRepository(
//           productDiscountApi: Get.find<ProductDiscountApi>()),
//       fenix: true);
//   Get.lazyPut(() => CategoryRepository(categoryApi: Get.find<CategoryApi>()),
//       fenix: true);
//
//   // controllers
//   Get.lazyPut(() => LocationController(), fenix: true);
//   Get.lazyPut(() => CartController(), fenix: true);
//   Get.lazyPut(() => OptionController(), fenix: true);
//   Get.lazyPut(() => AuthController(Get.find<UserRepository>()), fenix: true);
//   Get.lazyPut(() => OnBoardingController(), fenix: true);
//   Get.lazyPut(
//           () => ChatController(
//           messageRepository: Get.find<MessageRepository>(),
//           chatRepository: Get.find<ChatRepository>()),
//       fenix: true);
//   Get.lazyPut(
//           () => NewRestaurantController(
//         imageStorageRepository: Get.find<ImageStorageRepository>(),
//         provinceRepository: Get.find<ProvinceRepository>(),
//         restaurantRepository: Get.find<RestaurantRepository>(),
//         categoryRepository: Get.find<CategoryRepository>(),
//       ),
//       fenix: true);
//   Get.lazyPut(
//           () => NewDishController(
//           imageStorageRepository: Get.find<ImageStorageRepository>(),
//           dishRepository: Get.find<DishRepository>()),
//       fenix: true);
//   Get.lazyPut(
//           () => MenuRestaurantController(
//           menuRepository: Get.find<MenuRepository>(),
//           discountRepository: Get.find<ProductDiscountRepository>(),
//           restaurantRepository: Get.find<RestaurantRepository>()),
//       fenix: true);
//   Get.lazyPut(
//           () =>
//           OrderManagerController(orderRepository: Get.find<OrderRepository>()),
//       fenix: true);
//   Get.lazyPut(
//           () => RestaurantManagerController(
//           restaurantRepository: Get.find<RestaurantRepository>()),
//       fenix: true);
//   Get.lazyPut(
//           () => AccountController(
//           restaurantRepository: Get.find<RestaurantRepository>(),
//           userRepository: Get.find<UserRepository>()),
//       fenix: true);
//   Get.lazyPut(
//           () => VoucherController(
//           voucherRepository: Get.find<VoucherRepository>(),
//           productDiscountRepository: Get.find<ProductDiscountRepository>()),
//       fenix: true);
//   Get.lazyPut(
//           () => ProductDiscountController(
//           productDiscountRepository: Get.find<ProductDiscountRepository>()),
//       fenix: true);
//   Get.lazyPut(
//           () => NewProductDiscountController(
//           productDiscountRepository: Get.find<ProductDiscountRepository>(),
//           dishRepository: Get.find<DishRepository>()),
//       fenix: true);
//   Get.lazyPut(
//           () => ConversationController(
//           chatRepository: Get.find<ChatRepository>(),
//           userRepository: Get.find<UserRepository>()),
//       fenix: true);
//   Get.lazyPut(() => InformationController(), fenix: true);
//   Get.lazyPut(() => DishController(), fenix: true);
//   Get.lazyPut(() => OrderController(), fenix: true);
//   Get.lazyPut(() => NewGroupOptionController(), fenix: true);
//   Get.lazyPut(() => ConfirmOrderController(), fenix: true);
// }
