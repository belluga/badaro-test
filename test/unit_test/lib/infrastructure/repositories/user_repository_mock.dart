import 'dart:convert';

import 'package:badaro_test/domain/models/user_model.dart';
import 'package:badaro_test/domain/repository/user_repository_contract.dart';
import 'package:badaro_test/infrastructure/dal/dao/user_dto.dart';

class UserRepostoryMock extends UserRepositoryContract {
  @override
  Future<void> init() async {
    await _retrieveUsers();

    return Future.value();
  }

  Future<void> _retrieveUsers() async {
    final String _json = _userJson;
    final _userDTO = UserDTO.fromJson(jsonDecode(_json));
    final UserModel _user = _userDTO.toDomain();
    userStream.addValue(_user);
  }

  String get _userJson =>
      '{"name": "Roberta Miranda","identification":"081924532","profile_photo_url":"https://i.pinimg.com/originals/79/43/26/79432686e5020b0fcfe0f1f9f5d8e21f.jpg","company_dto":{"name":"Empresa Badaró", "address":"Badaró S750 Colab QP COPACABANA - Rio de Janeiro/RJ - Brasil"}}';
}
