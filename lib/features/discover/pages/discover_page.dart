import 'package:flutter/material.dart';
import 'package:bacanews/features/discover/widgets/discover_header.dart';
import 'package:bacanews/features/discover/widgets/discover_search_bar.dart';
import 'package:bacanews/features/discover/widgets/discover_tab_bar.dart';
import 'package:bacanews/features/discover/widgets/news_list_discover.dart';
import 'package:bacanews/features/discover/pages/search_result_page.dart'; // Correct URI for SearchResultPage

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<String> categories = [];
  String selectedCategory = 'All'; // Default category to 'All'

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  // Load categories when the page is initialized
  Future<void> _loadCategories() async {
    setState(() {
      categories = [
        'All', // Add 'All' category to show all news
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
    });
  }

  // Handling search submission
  void _onSearchSubmitted(String query) {
    if (query.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultPage(query: query),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Discover Header
            const SliverToBoxAdapter(child: DiscoverHeader()),

            // Search Bar
            SliverToBoxAdapter(
              child: DiscoverSearchBar(onSearchSubmitted: _onSearchSubmitted),
            ),

            // Discover Tab Bar
            SliverToBoxAdapter(
              child: DiscoverTabBar(
                categories: categories,
                selectedCategory: selectedCategory,
                onTabSelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
            ),

            // News List Discover
            NewsListDiscover(
                category:
                    selectedCategory), // Pass category to NewsListDiscover
          ],
        ),
      ),
    );
  }
}
