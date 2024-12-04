import 'package:flutter/material.dart';
import 'package:bacanews/models/news_model.dart';
import 'news_list_item.dart';

class NewsList extends StatelessWidget {
  final List<News> newsList;

  const NewsList({Key? key, required this.newsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (newsList.isEmpty) {
      return Center(child: Text('Tidak ada berita untuk ditampilkan.'));
    }

    return Column(
      children: newsList.map((news) {
        return NewsListItem(
          title: news.title,
          imageUrl: news.imageUrl ?? '',
          author: 'Unknown author',
          category: news.category,
          authorImageAssetPath: '',
          date: news.publishedAt,
          link: news.url,
          content: news.description ??
              'No description available', // Use description here
        );
      }).toList(),
    );
  }
}
