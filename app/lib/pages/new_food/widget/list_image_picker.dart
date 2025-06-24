import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:get/get.dart';

import '../../../values/app_colors.dart';

class ListImagePicker extends StatelessWidget {
  const ListImagePicker({
    required this.imageFile,
    required this.imgFromGallery,
    required this.imgFromCamera,
    super.key,
  });

  final RxList<File> imageFile;
  final Function imgFromGallery;
  final Function imgFromCamera;

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              const SizedBox(height: 50),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Thư viện"),
                onTap: () {
                  imgFromGallery();
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Máy ảnh"),
                onTap: () {
                  imgFromCamera();
                  Get.back();
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double heightImage = 100.h;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(5),
            strokeWidth: 1,
            dashPattern: const [5, 2],
            color: AppColors.primaryColor,
            child: imageFile.isEmpty
                ? Container(
                    height: heightImage,
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo,
                              color: AppColors.primaryColor,
                              size: 40.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: heightImage,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: imageFile.length + 1,
                            padding: const EdgeInsets.all(10),
                            itemBuilder: (context, index) {
                              if (index == imageFile.length) {
                                return GestureDetector(
                                  onTap: () {
                                    _showPicker(context);
                                  },
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          height: 60.w,
                                          width: 60.w,
                                          image:
                                              AssetImage(AppAssets.addImageUrl),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return Container(
                                margin: const EdgeInsets.only(right: 5),
                                height: 60.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Stack(children: [
                                    Image.file(
                                      imageFile[index],
                                      fit: BoxFit.cover,
                                      width: 70.w,
                                    ),
                                    Positioned(
                                      top: -10,
                                      right: -10,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.close,
                                          size: 20,
                                          color: AppColors.primaryColor,
                                        ),
                                        onPressed: () {
                                          imageFile.removeAt(index);
                                        },
                                      ),
                                    ),
                                  ]),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
