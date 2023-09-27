import 'package:badaro_test/domain/models/company_model.dart';
import 'package:badaro_test/domain/value_objects/company/company_address_value.dart';
import 'package:badaro_test/domain/value_objects/company/company_name_value.dart';

class CompanyDTO {
  final String name;
  final String address;

  CompanyDTO({
    required this.name,
    required this.address,
  });

  CompanyModel toDomain() {
    return CompanyModel(
      name: CompanyNameValue()..parse(name),
      address: CompanyAddressValue()..parse(address),
    );
  }

  factory CompanyDTO.fromJson(Map<String, dynamic> json) {
    final String _address = json["address"];
    final String _name = json["name"];

    return CompanyDTO(
      name: _name,
      address: _address,
    );
  }
}
