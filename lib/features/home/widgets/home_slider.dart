// lib/features/home/widgets/home_slider.dart
import 'package:flutter/material.dart';
import 'package:bacanews/services/news_service.dart';
import 'package:bacanews/models/news_model.dart';
import 'home_slider_item.dart';
import 'home_slider_indicator_item.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  late final PageController _pageController;
  late final ScrollController _scrollController;
  late final double _indicatorsVisibleWidth;

  List<News> _sliderItems = [];

  int _pageIndex = 0;

  final _displayIndicatorsCount = 5.0;
  final _indicatorWidth = 10.0;
  final _activeIndicatorWidth = 32.0;
  final _indicatorMargin = const EdgeInsets.symmetric(horizontal: 2);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1000);
    _scrollController =
        ScrollController(initialScrollOffset: _calculateIndicatorOffset());

    _indicatorsVisibleWidth = _calculateIndicatorWidth();

    // Fetch the top news
    _fetchTopNews();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  double _calculateIndicatorWidth() {
    final indicatorTotalWidth =
        _indicatorWidth + _indicatorMargin.left + _indicatorMargin.right;
    final activeIndicatorTotalWidth =
        _activeIndicatorWidth + _indicatorMargin.left + _indicatorMargin.right;
    return activeIndicatorTotalWidth +
        ((_displayIndicatorsCount - 1) * indicatorTotalWidth);
  }

  double _calculateIndicatorOffset() {
    final indicatorsCountBeforeCentral = (_displayIndicatorsCount - 1) / 2;
    final offset =
        (_indicatorWidth + _indicatorMargin.left + _indicatorMargin.right) *
            (_pageIndex + 999 - indicatorsCountBeforeCentral);

    return offset;
  }

  // Fetch the latest news for top-news category
  Future<void> _fetchTopNews() async {
    try {
      // Fetch top 6 news items
      var newsList = await NewsService().fetchNews('top-news', page: 1);
      if (newsList.isNotEmpty) {
        // Take the first 6 news items
        setState(() {
          _sliderItems = newsList.take(6).toList();
        });
      }
    } catch (e) {
      print('Error fetching top news: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          if (_sliderItems.isEmpty)
            const Center(
                child:
                    CircularProgressIndicator()) // Show loading if news is not fetched
          else ...[
            SizedBox(
              height: 235,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex = value % _sliderItems.length;
                  });
                  _scrollController.animateTo(
                    _calculateIndicatorOffset(),
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                  );
                },
                controller: _pageController,
                itemBuilder: (context, index) {
                  final i = index % _sliderItems.length;
                  final news = _sliderItems[i];
                  return HomeSliderItem(
                    isActive: _pageIndex == i,
                    imageUrl: news.imageUrl ?? '',
                    category: news.category,
                    title: news.title,
                    content: news.description ?? '',
                    date: news.publishedAt,
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Align(
              child: SizedBox(
                width: _indicatorsVisibleWidth,
                height: _indicatorWidth,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _sliderItems.length,
                  itemBuilder: (context, index) {
                    final isActive = index == _pageIndex % _sliderItems.length;
                    return HomeSliderIndicatorItem(
                      isActive: isActive,
                      activeWidth: _activeIndicatorWidth,
                      width: _indicatorWidth,
                      margin: _indicatorMargin,
                    );
                  },
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
