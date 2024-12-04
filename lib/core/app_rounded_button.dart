import 'package:flutter/material.dart';

class AppRoundedButton extends StatelessWidget {
  final Function()? onTap;
  final IconData iconData;
  const AppRoundedButton({Key? key, this.onTap, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor, // Background berubah sesuai tema
      borderRadius: BorderRadius.circular(56),
      child: InkWell(
        borderRadius: BorderRadius.circular(56),
        onTap: onTap,
        child: SizedBox(
          width: 56,
          height: 56,
          child: Icon(
            iconData,
            color: Theme.of(context).iconTheme.color, // Warna ikon sesuai tema
          ),
        ),
      ),
    );
  }
}
