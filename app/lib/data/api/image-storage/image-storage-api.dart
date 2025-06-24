import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageStorageApi {
  final supabase = SupabaseClient(
      dotenv.env['SUPABASE_URL'] ?? '', dotenv.env['SUPABASE_ANON_KEY'] ?? '');
  Future<String> uploadFileToSupabaseStorage(
      File file, String bucketName, String path) async {
    try {
      final file1 = file.readAsBytesSync();
      final response =
          await supabase.storage.from(bucketName).uploadBinary(path, file1);
      print(response);
      return supabase.storage.from(bucketName).getPublicUrl(path);
    } catch (e) {
      rethrow;
    }
  }
}
