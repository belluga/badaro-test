import 'package:badaro_test/domain/models/user_model.dart';
import 'package:flutter/material.dart';

class UserMainCard extends StatelessWidget {
  final UserModel userModel;

  const UserMainCard({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 4,
              height: 100,
              // height: double.infinity,
              color: Theme.of(context).primaryColor,
            ),
            Expanded(
                child: Column(
              children: [
                Text("Olá, ${userModel.fullName.firstName}"),
                Text(userModel.company.name.value),
                Text(userModel.company.address.value),
              ],
            )),
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      userModel.profilePhotoUriValue.value.toString()),
                ),
                Text(
                  userModel.fullName.valueFormated,
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 4,
              height: 50,
              // height: double.infinity,
              color: Theme.of(context).colorScheme.error,
            ),
            Expanded(
              child: Text(
                userModel.identificationValue.value,
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Meus dados"))
          ],
        )
      ],
    );
  }
}
