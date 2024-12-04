import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String email;
  final String avatarPath;

  const ProfileHeader({
    Key? key,
    required this.name,
    required this.email,
    required this.avatarPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor, // Gunakan warna tema
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: avatarPath.isNotEmpty
                ? AssetImage(avatarPath)
                : AssetImage('assets/images/ava/wanita 1.png'),
            radius: 45,
            backgroundColor: const Color.fromRGBO(111, 168, 211, 1),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              color: Theme.of(context).textTheme.headlineSmall?.color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            email,
            style: TextStyle(
              color: Theme.of(context).textTheme.bodySmall?.color,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
