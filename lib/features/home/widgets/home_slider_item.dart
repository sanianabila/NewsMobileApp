// lib/features/home/widgets/home_slider_item.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/utils/app_date_formatters.dart';
import '../pages/single_news_item_page.dart';
import 'package:bacanews/theme/colors.dart';

class HomeSliderItem extends StatelessWidget {
  final bool isActive;
  final String imageUrl;
  final String category;
  final String title;
  final String content;
  final DateTime date;

  const HomeSliderItem({
    super.key,
    required this.isActive,
    required this.imageUrl,
    required this.category,
    required this.title,
    required this.date,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Menambahkan nilai default untuk parameter yang hilang
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleNewsItemPage(
              title: title,
              content: content,
              category: category,
              imageUrl: imageUrl,
              date: date,
              authorImageAssetPath:
                  '', // Menyediakan nilai default untuk authorImageAssetPath
              link: '', // Menyediakan nilai default untuk link
              author: '', // Menyediakan nilai default untuk author
            ),
          ),
        );
      },
      child: FractionallySizedBox(
        widthFactor: 1.08,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 400),
          scale: isActive ? 1 : 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: double.maxFinite,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Chip(
                    label: Text(
                      category,
                      style: const TextStyle(color: AppColors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide.none,
                    ),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.black08,
                        AppColors.black06,
                        AppColors.black00,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppDateFormatters.mdY(date),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.white),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
