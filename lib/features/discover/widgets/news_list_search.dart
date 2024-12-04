import 'package:flutter/material.dart';
import 'package:bacanews/services/news_service.dart';
import 'package:bacanews/models/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bacanews/features/home/pages/single_news_item_page.dart';

class NewsListSearch extends StatefulWidget {
  final String query;

  const NewsListSearch({Key? key, required this.query}) : super(key: key);

  @override
  _NewsListSearchState createState() => _NewsListSearchState();
}

class _NewsListSearchState extends State<NewsListSearch> {
  List<News> _searchResults = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _performSearch();
  }

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    final newsService = NewsService();
    final categories = [
      'top-news',
      'latest',
      'politik',
      'hukum',
      'ekonomi',
      'metro',
      'sepakbola',
      'olahraga',
      'humaniora',
      'lifestyle',
      'hiburan',
      'dunia',
      'tekno',
      'otomotif',
      'warta-bumi',
    ];

    List<News> results = [];
    for (var category in categories) {
      final newsList = await newsService.fetchNews(category);
      results.addAll(
        newsList.where(
          (news) =>
              news.title.toLowerCase().contains(widget.query.toLowerCase()) ||
              category.toLowerCase().contains(widget.query.toLowerCase()),
        ),
      );
    }

    if (mounted) {
      setState(() {
        _searchResults = results;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_searchResults.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(child: Text('No results found.')),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final news = _searchResults[index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SingleNewsItemPage(
                      title: news.title,
                      content: news.description ?? '',
                      category: news.category,
                      imageUrl: news.imageUrl ?? '',
                      date: news.publishedAt,
                      authorImageAssetPath: '',
                      author: '',
                      link: news.url,
                    ),
                  ),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Gambar di kiri dan rata tengah
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: news.imageUrl ?? '',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kategori dalam box, huruf kecil
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            news.category.toLowerCase(), // Huruf kecil
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Judul Berita
                        Text(
                          news.title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 8),
                        // Tanggal dengan format "Published on"
                        Text(
                          'Published on ${news.publishedAt.day}/${news.publishedAt.month}/${news.publishedAt.year}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: _searchResults.length,
      ),
    );
  }
}
