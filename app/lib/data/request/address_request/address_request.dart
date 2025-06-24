import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_request.freezed.dart';
part 'address_request.g.dart';

@Freezed()
class AddressRequest with _$AddressRequest {
  const factory AddressRequest({
    required String address,
    required int provinceCode,
    required int districtCode,
    required int wardCode,
  }) = _AddressRequest;
  factory AddressRequest.fromJson(Map<String, dynamic> json) =>
      _$AddressRequestFromJson(json);
}
