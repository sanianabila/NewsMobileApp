import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import untuk Clipboard
import 'package:bacanews/theme/colors.dart'; // Pastikan AppColors didefinisikan di sini
import 'package:bacanews/features/home/widgets/single_news_item_header.dart'; // Pastikan import ini ada

class SingleNewsItemPage extends StatelessWidget {
  final String title;
  final String content;
  final String category;
  final String authorImageAssetPath;
  final String imageUrl;
  final DateTime date;
  final String link;
  final String author;

  const SingleNewsItemPage({
    super.key,
    required this.title,
    required this.content,
    required this.category,
    required this.authorImageAssetPath,
    required this.imageUrl,
    required this.date,
    required this.link,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SingleNewsItemHeaderDelegate(
              borderRadiusAnimationValue: (value) {},
              title: title,
              category: category,
              date: date,
              imageUrl: imageUrl,
              minExtent: 56,
              maxExtent: MediaQuery.of(context).size.height / 2,
              topPadding: MediaQuery.of(context).padding.top,
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: AnimatedContainer(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: isDarkMode ? const Color(0xFF1E1E1E) : AppColors.white,
              ),
              duration: const Duration(milliseconds: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content.isNotEmpty ? content : 'No content available',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : AppColors.black08,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _copyToClipboard(context, link),
                      child: const Text(
                        'Salin Link Berita',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.azureRadiance,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk menyalin URL ke clipboard
  void _copyToClipboard(BuildContext context, String url) async {
    if (url.isNotEmpty) {
      await Clipboard.setData(
          ClipboardData(text: url)); // Menyalin URL ke clipboard
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Link berita telah disalin: $url')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('URL tidak valid')),
      );
    }
  }
}
