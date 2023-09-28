import 'package:badaro_test/domain/models/user_model.dart';
import 'package:badaro_test/presentation/home/widgets/user_avatar.dart';
import 'package:flutter/material.dart';

class UserMainCard extends StatelessWidget {
  final UserModel userModel;

  const UserMainCard({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 120,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 24),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Olá, ${userModel.fullName.firstName}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          userModel.company.name.value.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w700,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          userModel.company.address.value,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
              Column(
                children: [
                  UserAvatar(
                    avatarUrl: userModel.profilePhotoUriValue.value,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 8,

                height: 50,
                // height: double.infinity,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.credit_card),
                    SizedBox(width: 4),
                    Text(
                      userModel.identificationValue.value,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Meus dados"))
            ],
          )
        ],
      ),
    );
  }
}
