import 'package:flutter/material.dart';
import 'package:bacanews/theme/colors.dart';

class ProfileSwitchItem extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool)? onChanged;

  const ProfileSwitchItem({
    Key? key,
    required this.title,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context)
          .cardColor, // Gunakan warna dinamis untuk latar belakang
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).textTheme.bodySmall?.color,
          ),
        ),
        trailing: Switch(
          value: value,
          activeColor: AppColors.azureRadiance,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
