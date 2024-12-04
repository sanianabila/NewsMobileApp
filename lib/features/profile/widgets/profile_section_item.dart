import 'package:flutter/material.dart';

class ProfileSectionItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap; // Menambahkan parameter onTap

  const ProfileSectionItem({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap, // Mengizinkan parameter onTap kosong
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap, // Menambahkan aksi saat ditekan
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: Icon(icon, color: Theme.of(context).iconTheme.color),
      title: Text(
        title,
        style:
            TextStyle(color: Theme.of(context).textTheme.headlineSmall?.color),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
