import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/controller/location_controller.dart';
import 'package:food_delivery_app/pages/home/navigation_home.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/services/location_service.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final LocationController locationController = Get.find<LocationController>();

  @override
  void initState() {
    print("lấy");
    LocationService.instance.getUserLocation(locationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: AppColors.whiteColor),
        child: Obx(() {
          return locationController.isAccessingLocation.value
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(),
                      Text('Accessing location'),
                    ],
                  ),
                )
              : locationController.errorDescription.value.isNotEmpty ||
                      locationController.userLocation.value == null
                  ? Center(
                      child: Container(
                      width: 240.h,
                      height: 500.h,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Allow access to location',
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 20.h, top: 30.h),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Color(0xffcccccc)))),
                              child: Text(
                                'Please allow the application to access your location to continue using DFood.',
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SimpleDialogOption(
                              child: TextButton(
                                onPressed: () {
                                  AppSettings.openAppSettings(
                                      type: AppSettingsType.location);
                                },
                                child: Text(
                                  'Allow access to location',
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
                  : Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(AppAssets.locationImg),
                          SizedBox(
                            height: 30.h,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Get.to(() => NavigationHome());
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Center(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'ACCESS LOCATION',
                                      style: AppStyles.h4.copyWith(
                                          color: AppColors.whiteColor),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(AppAssets.locationIcon)
                                  ],
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'DFOOD WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP',
                            style: AppStyles.h4.copyWith(
                              color: Color(0xff646982),
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
        }),
      ),
    );
  }
}
