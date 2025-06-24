import '../../../common/network/api_helper.dart';
import '../../../common/network/dio_client.dart';
import '../../../values/app_config.dart';

class ProvinceApi with ApiHelper<Map<String, dynamic>> {
  final DioClient dioClient;

  ProvinceApi({required this.dioClient});

  Future<List<Map<String, dynamic>>> getProvinces() async {
    final response = await dioClient.dioAddress
        .get('${ApiConfig.provinces}/?basic=true&limit=100');
    return (response.data!['results'] as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  Future<List<Map<String, dynamic>>> getDistricts(int provinceCode) async {
    final response =
        await dioClient.dioAddress.get('${ApiConfig.provinces}/$provinceCode');
    return (response.data!['districts'] as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  Future<List<Map<String, dynamic>>> getWards(int districtCode) async {
    final response = await dioClient.dioAddress
        .get('/wards/?district_id=$districtCode&basic=true&limit=100');
    return (response.data!['results'] as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }
}
