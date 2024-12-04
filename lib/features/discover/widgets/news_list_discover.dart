import 'package:flutter/material.dart';
import 'package:bacanews/services/news_service.dart';
import 'package:bacanews/features/home/pages/single_news_item_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bacanews/models/news_model.dart';
import 'package:intl/intl.dart'; // Import untuk format tanggal

class NewsListDiscover extends StatefulWidget {
  final String category;

  const NewsListDiscover({Key? key, required this.category}) : super(key: key);

  @override
  _NewsListDiscoverState createState() => _NewsListDiscoverState();
}

class _NewsListDiscoverState extends State<NewsListDiscover> {
  late ScrollController _scrollController;
  List<News> _newsList = [];
  int _currentPage = 1;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _loadNews();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void didUpdateWidget(NewsListDiscover oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      _loadNews(); // Reload berita jika kategori berubah
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadNews() async {
    setState(() {
      _isLoading = true;
    });

    final newsService = NewsService();

    if (widget.category == 'All') {
      // Mengambil berita dari semua kategori dan mengacak urutan berita
      final allCategories = [
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

      List<News> allNews = [];
      for (var category in allCategories) {
        final news = await newsService.fetchNews(category, page: _currentPage);
        allNews.addAll(news);
      }

      // Mengacak urutan berita
      allNews.shuffle();

      if (mounted) {
        setState(() {
          _newsList = allNews;
          _isLoading = false;
        });
      }
    } else {
      // Mengambil berita berdasarkan kategori tertentu
      final news =
          await newsService.fetchNews(widget.category, page: _currentPage);
      if (mounted) {
        setState(() {
          _newsList = news;
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _loadMoreData() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
      _currentPage++;
    });

    final newsService = NewsService();

    if (widget.category == 'All') {
      // Mengambil lebih banyak berita dari semua kategori dan mengacak urutan berita
      final allCategories = [
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

      List<News> moreNews = [];
      for (var category in allCategories) {
        final news = await newsService.fetchNews(category, page: _currentPage);
        moreNews.addAll(news);
      }

      // Mengacak urutan berita
      moreNews.shuffle();

      if (mounted) {
        setState(() {
          _newsList.addAll(moreNews);
          _isLoading = false;
        });
      }
    } else {
      // Mengambil lebih banyak berita berdasarkan kategori tertentu
      final moreNews =
          await newsService.fetchNews(widget.category, page: _currentPage);
      if (mounted) {
        setState(() {
          _newsList.addAll(moreNews);
          _isLoading = false;
        });
      }
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          if (i >= _newsList.length) {
            return const Center(child: CircularProgressIndicator());
          }

          final news = _newsList[i];

          // Format tanggal menggunakan DateFormat
          final formattedDate =
              DateFormat('d/MM/yyyy').format(news.publishedAt);

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
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
                        // Kategori berita dalam kotak dengan huruf kecil
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            news.category.toLowerCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          news.title,
                          style: Theme.of(context).textTheme.titleMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        // Tanggal berita
                        Text(
                          'Published on: $formattedDate',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: _newsList.length + 1, // Add one for the loading indicator
      ),
    );
  }
}
