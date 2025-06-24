import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/values/app_styles.dart';
import 'package:get/get.dart';

import '../../../values/app_colors.dart';

class TextImagePicker extends StatelessWidget {
  const TextImagePicker({
    required this.imageFile,
    required this.imgFromGallery,
    required this.imgFromCamera,
    required this.title,
    super.key,
  });
  final String title;
  final Rx<File?> imageFile;
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

    return Container(
      width: double.infinity,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () =>
               Container(
                child: imageFile.value == null
                    ? Container(
                        height: 50.w,
                        width: 50.w,
                        color: Colors.white,
                        child: GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(5),
                            color: AppColors.primaryColor,
                            strokeWidth: 1,
                            dashPattern: const [5, 2],
                            child: Center(
                              child: Container(
                                color: Colors.white,
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: AppColors.primaryColor,
                                  size: 24.w,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: heightImage,
                              child: Image.file(
                                imageFile.value!,
                                fit: BoxFit.cover,
                                width: 70.w,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
        ],
      ),
    );
  }
}
