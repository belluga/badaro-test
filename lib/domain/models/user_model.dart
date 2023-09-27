import 'package:badaro_test/domain/models/company_model.dart';
import 'package:badaro_test/domain/value_objects/user/user_identification_value.dart';
import 'package:badaro_test/domain/value_objects/user/user_name_value.dart';
import 'package:badaro_test/domain/value_objects/user/user_profile_photo_uri_value.dart';

class UserModel {
  final UserFullnameValue fullName;
  final UserIdentificationValue identificationValue;
  final UserProfilePhotoUriValue profilePhotoUriValue;
  final CompanyModel company;

  UserModel({
    required this.fullName,
    required this.identificationValue,
    required this.profilePhotoUriValue,
    required this.company,
  });
}
