import 'package:flutter/material.dart';

class HomeHeading extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Widget? trailing;

  const HomeHeading({
    Key? key,
    required this.title,
    this.trailing,
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Text(
              title,
              style: titleStyle ?? // Gunakan style yang dikirim atau fallback
                  Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight
                            .bold, // Default bold jika tidak ada titleStyle
                      ),
            ),
            const Spacer(),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
