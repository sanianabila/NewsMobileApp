import 'package:flutter/material.dart';
import 'package:bacanews/features/home/widgets/home_slider.dart';
import 'package:bacanews/features/home/widgets/home_heading.dart';
import 'package:bacanews/features/home/widgets/home_top_buttons.dart';
import '../widgets/news_list.dart';
import 'package:bacanews/services/news_service.dart';
import 'package:bacanews/models/news_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<News>> _newsFuture;
  String _selectedCategory = 'latest'; // Ubah kategori default menjadi 'latest'

  @override
  void initState() {
    super.initState();
    _newsFuture = NewsService()
        .fetchNews(_selectedCategory); // Memanggil dengan kategori 'latest'
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const HomeTopButtons(),
            HomeHeading(
              title: 'Top News',
            ),
            const HomeSlider(),
            HomeHeading(
              title: 'Latest News',
            ),
            FutureBuilder<List<News>>(
              future: _newsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Center(child: Text('Tidak ada berita tersedia.')),
                  );
                } else {
                  final newsList = snapshot.data!;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return NewsList(newsList: newsList);
                      },
                      childCount: 1, // Cukup satu NewsList
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
