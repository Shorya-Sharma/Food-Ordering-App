import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../controller/menu_controller.dart';
import '../../../values/app_colors.dart';
import '../../../values/app_constant.dart';
import '../../../values/app_styles.dart';

// class TabGroupOptionsWidget extends StatelessWidget {
//   const TabGroupOptionsWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<MenuRestaurantController>();
//     return Container(
//       height: 100.h,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Column(
//         children: [
//           Container(
//             height: height * 0.7,
//             child: FutureBuilder(
//               future: controller.groupOptions,
//               builder: (context, snapshot) {
//                 controller.resultGroupOptions = snapshot.data ?? [];
//                 controller.runFilter(controller.seachController.text);
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.data!.isBlank == true) {
//                   return Center(
//                     child: Text(
//                       "Don't have any group option",
//                       style: AppStyles.roboto16semiBold
//                           .apply(color: AppColors.primaryColor),
//                     ),
//                   );
//                 } else if (snapshot.data!.isNotEmpty) {
//                   return Container(
//                     height: double.maxFinite,
//                     width: double.maxFinite,
//                     child: Obx(
//                       () => ListView.builder(
//                         padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
//                         itemCount: controller.filterGroupOptions.value.length,
//                         itemBuilder: (context, index) {
//                           var groupOption =
//                               controller.filterGroupOptions.value[index];
//                           return Padding(
//                             padding: const EdgeInsets.only(bottom: 8),
//                             child: GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10.0),
//                                 width: MediaQuery.of(context).size.width,
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.12,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(8.h),
//                                     color: Colors.white60),
//                                 child: ListTile(
//                                   contentPadding: EdgeInsets.symmetric(
//                                       horizontal: 4.w, vertical: 0),
//                                   // horizontalTitleGap: 6,
//                                   minLeadingWidth: 0,
//                                   minVerticalPadding: 0,
//                                   leading: ClipRRect(
//                                     borderRadius: BorderRadius.circular(8),
//                                     child: CachedNetworkImage(
//                                       width: 60,
//                                       height: 70,
//                                       imageUrl: "",
//                                       fit: BoxFit.cover,
//                                       errorWidget:
//                                           (context, error, stackTrace) {
//                                         return Image.asset(
//                                           "assets/images/default_image.png",
//                                           fit: BoxFit.cover,
//                                         );
//                                       },
//                                     ),
//                                   ),
//                                   title: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         groupOption.name,
//                                         overflow: TextOverflow.ellipsis,
//                                         maxLines: 2,
//                                         style: AppStyles.roboto16semiBold,
//                                       ),
//                                       const SizedBox.square(
//                                         dimension: 10,
//                                       ),
//                                       Text(groupOption.minimum.toString(),
//                                           maxLines: 1,
//                                           overflow: TextOverflow.ellipsis,
//                                           style: AppStyles.roboto12regular),
//                                     ],
//                                   ),
//                                   trailing: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Text(
//                                         groupOption.optional
//                                             ? "Optional"
//                                             : "Required",
//                                         style: AppStyles.roboto12regular,
//                                       ),
//                                       const Icon(Ionicons
//                                           .arrow_forward_circle_outline),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Center(
//                     child: Text(
//                       "Error happened",
//                       style: AppStyles.roboto16semiBold
//                           .apply(color: AppColors.primaryColor),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
