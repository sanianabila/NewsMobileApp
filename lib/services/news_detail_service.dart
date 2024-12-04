import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

class NewsDetailService {
  Future<String> fetchFullContent(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final document = parse(response.body);

      // Sesuaikan selector untuk mengambil konten yang benar
      final contentElement = document.querySelector(
          '.article-content'); // Ganti dengan selector yang sesuai
      if (contentElement != null) {
        return contentElement.text
            .trim(); // Ambil konten dalam teks dan hapus spasi di sekitar
      } else {
        return 'Konten tidak ditemukan';
      }
    } else {
      throw Exception('Gagal memuat konten detail');
    }
  }

  Future<String> fetchAuthor(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final document = parse(response.body);

      // Periksa elemen author di HTML
      final authorElement = document
          .querySelector('.author-name'); // Ganti dengan selector yang sesuai
      if (authorElement != null) {
        return authorElement.text.trim(); // Ambil nama author
      } else {
        return 'Unknown Author';
      }
    } else {
      throw Exception('Gagal memuat data author');
    }
  }
}
