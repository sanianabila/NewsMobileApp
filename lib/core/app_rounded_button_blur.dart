import 'dart:ui';
import 'package:flutter/material.dart';

class AppRoundedButtonBlur extends StatelessWidget {
  final Function()? onTap;
  final IconData iconData;
  const AppRoundedButtonBlur({Key? key, this.onTap, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context)
          .cardColor
          .withOpacity(0.2), // Background berubah sesuai tema
      borderRadius: BorderRadius.circular(56),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(56),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(56),
            onTap: onTap,
            child: SizedBox(
              width: 56,
              height: 56,
              child: Icon(
                iconData,
                color:
                    Theme.of(context).iconTheme.color, // Warna ikon sesuai tema
              ),
            ),
          ),
        ),
      ),
    );
  }
}
