import 'package:flutter/material.dart';
import 'package:mobii_test/mobii_list/domain/models/user_dto.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
  });
  final UserDto user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Image.network(user.imageUrl ?? '')),
      onTap: () {},
      title: Row(
        children: [
          Text(user.id ?? ''),
          const SizedBox(width: 16),
          Text(user.name ?? ''),
        ],
      ),
    );
  }
}
