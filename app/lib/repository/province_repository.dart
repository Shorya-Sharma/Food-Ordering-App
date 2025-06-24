import '../common/repository/repository_helper.dart';
import '../data/api/province/province_api.dart';

class ProvinceRepository with RepositoryHelper<Map<String, dynamic>> {
  final ProvinceApi provinceApi;

  const ProvinceRepository({required this.provinceApi});

  Future<List<Map<String, dynamic>>> getProvinces() async {
    return await provinceApi.getProvinces();
  }

  Future<List<Map<String, dynamic>>> getDistricts(int provinceCode) async {
    return await provinceApi.getDistricts(provinceCode);
  }

  Future<List<Map<String, dynamic>>> getWards(int wardCode) async {
    return await provinceApi.getWards(wardCode);
  }
}
