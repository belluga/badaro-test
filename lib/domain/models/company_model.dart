import 'package:badaro_test/domain/value_objects/company/company_address_value.dart';
import 'package:badaro_test/domain/value_objects/company/company_name_value.dart';

class CompanyModel {
  final CompanyNameValue name;
  final CompanyAddressValue address;

  CompanyModel({
    required this.name,
    required this.address,
  });
}
