import 'package:badaro_test/infrastructure/dal/dao/company_dto.dart';

class UserDTO {
  final String name;
  final String identification;
  final String profilePhotoUrl;
  final CompanyDTO company;

  UserDTO({
    required this.name,
    required this.identification,
    required this.profilePhotoUrl,
    required this.company,
  });
}
