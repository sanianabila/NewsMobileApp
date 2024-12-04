import 'package:flutter/cupertino.dart'; // Menggunakan CupertinoIcons
import 'package:flutter/material.dart';
import 'package:bacanews/core/app_rounded_button.dart'; // Import AppRoundedButton
// import 'package:bacanews/features/home/pages/home_page.dart'; // Misal kembali ke HomePage

class DiscoverHeader extends StatelessWidget {
  const DiscoverHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row untuk ikon back menggunakan AppRoundedButton
          Row(
            children: [
              AppRoundedButton(
                iconData: CupertinoIcons.left_chevron,
                onTap: () {
                  // Menggunakan Navigator.pop untuk kembali ke halaman sebelumnya
                  Navigator.pop(context); // Perbaikan: Menggunakan pop
                },
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          // Title Discover dan Subtitle
          const Text(
            'Discover',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'News from all around the world',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
