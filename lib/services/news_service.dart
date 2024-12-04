import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';

class NewsService {
  Future<List<News>> fetchNews(String category, {int page = 1}) async {
    String url = _getUrlForCategory(category, page);

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        return data.map((json) => News.fromJson(json, category)).toList();
      } else {
        throw Exception('Gagal memuat berita: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gagal memuat berita: $e');
    }
  }

  Future<List<News>> searchNews(String query, {int page = 1}) async {
    final url =
        'https://berita-indo-api-next.vercel.app/api/antara-news/search?q=$query&page=$page';
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['data'];
        return data.map((json) => News.fromJson(json, 'search')).toList();
      } else {
        throw Exception('Gagal memuat hasil pencarian: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Gagal memuat hasil pencarian: $e');
    }
  }

  String _getUrlForCategory(String category, int page) {
    switch (category) {
      case 'latest':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/terkini?page=$page';
      case 'top-news':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/top-news?page=$page';
      case 'politik':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/politik?page=$page';
      case 'hukum':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/hukum?page=$page';
      case 'ekonomi':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/ekonomi?page=$page';
      case 'metro':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/metro?page=$page';
      case 'sepakbola':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/sepakbola?page=$page';
      case 'olahraga':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/olahraga?page=$page';
      case 'humaniora':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/humaniora?page=$page';
      case 'lifestyle':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/lifestyle?page=$page';
      case 'hiburan':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/hiburan?page=$page';
      case 'dunia':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/dunia?page=$page';
      case 'infografik':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/infografik?page=$page';
      case 'tekno':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/tekno?page=$page';
      case 'otomotif':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/otomotif?page=$page';
      case 'warta-bumi':
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/warta-bumi?page=$page';
      default:
        return 'https://berita-indo-api-next.vercel.app/api/antara-news/terkini?page=$page';
    }
  }
}
