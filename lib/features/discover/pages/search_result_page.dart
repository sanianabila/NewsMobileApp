import 'package:flutter/material.dart';
import 'package:bacanews/features/discover/widgets/discover_header.dart';
import 'package:bacanews/features/discover/widgets/discover_search_bar.dart';
import 'package:bacanews/features/discover/widgets/discover_tab_bar.dart';
import 'package:bacanews/features/discover/widgets/news_list_search.dart'; // Correct URI for NewsListSearch
import 'package:bacanews/core/bottom_nav_bar.dart';

class SearchResultPage extends StatefulWidget {
  final String query;

  const SearchResultPage({Key? key, required this.query}) : super(key: key);

  @override
  _SearchResultPageState createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
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
        'All', // Default category to show all news
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
              child: DiscoverSearchBar(
                onSearchSubmitted: (query) {
                  // Perform search logic if needed
                },
              ),
            ),

            // Discover Tab Bar (Not clickable)
            SliverToBoxAdapter(
              child: DiscoverTabBar(
                categories: categories,
                selectedCategory: selectedCategory,
                onTabSelected: (category) {},
              ),
            ),

            // Title for Search Results
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Search Results for "${widget.query}"',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // News List Search (displaying the results based on query)
            NewsListSearch(query: widget.query),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        // Added BottomNavBar here as well
        currentIndex: 1, // Assume the user is on the 'Discover' tab
        onTap: (value) {
          // Logic for switching tabs
        },
      ),
    );
  }
}
