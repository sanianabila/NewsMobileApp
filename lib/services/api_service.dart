// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Contoh API yang mengambil data
  Future<List<String>> getSliderData() async {
    final response =
        await http.get(Uri.parse('https://api.example.com/sliders'));

    if (response.statusCode == 200) {
      // Parsing data JSON
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => item['title'] as String).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
