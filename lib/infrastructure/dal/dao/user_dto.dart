import 'package:badaro_test/domain/models/user_model.dart';
import 'package:badaro_test/domain/value_objects/user/user_identification_value.dart';
import 'package:badaro_test/domain/value_objects/user/user_name_value.dart';
import 'package:badaro_test/domain/value_objects/user/user_profile_photo_uri_value.dart';
import 'package:badaro_test/infrastructure/dal/dao/company_dto.dart';
import 'package:flutter/material.dart';

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

  UserModel toDomain() {
    return UserModel(
      company: company.toDomain(),
      fullName: UserFullnameValue()..parse(name),
      identificationValue: UserIdentificationValue()..parse(identification),
      profilePhotoUriValue: UserProfilePhotoUriValue()..parse(profilePhotoUrl),
    );
  }

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    final String _name = json["name"];
    final String _identification = json["identification"];
    final String _profilePhotoUrl = json["profile_photo_url"];
    final CompanyDTO _companyDTO = CompanyDTO.fromJson(json["company_dto"]);

    return UserDTO(
      name: _name,
      identification: _identification,
      profilePhotoUrl: _profilePhotoUrl,
      company: _companyDTO,
    );
  }

  static UserDTO? fromJsonTry(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    try {
      return UserDTO.fromJson(json);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return null;
    }
  }
}
