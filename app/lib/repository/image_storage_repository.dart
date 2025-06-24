import 'dart:io';

import 'package:uuid/uuid.dart';

import '../data/api/image-storage/image-storage-api.dart';

class ImageStorageRepository {
  ImageStorageApi imageStorageApi;
  ImageStorageRepository({required this.imageStorageApi});
  Future<List<String>> uploadImages(
      List<File> images, String imageTypeName) async {
    try {
      print("Upload line 42:");
      print(images.length.toString());
      final List<String> urls = [];
      const uuid = Uuid();
      for (var image in images) {
        String fileName = image.path.split('/').last;
        fileName = "${uuid.v4()}.${fileName.split('.').last}";
        var path = '$fileName';
        print('path $path');
        urls.add(await imageStorageApi.uploadFileToSupabaseStorage(
            image, imageTypeName, path));
      }
      print("Upload line 56:");
      print(urls.toString());
      return urls;
    } catch (e) {
      rethrow;
    }
  }
}
