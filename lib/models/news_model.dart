class News {
  final String title;
  final String? description;
  final String url;
  final String? imageUrl;
  final DateTime publishedAt;
  final String category;

  News({
    required this.title,
    this.description,
    required this.url,
    this.imageUrl,
    required this.publishedAt,
    required this.category,
  });

  factory News.fromJson(Map<String, dynamic> json, String category) {
    return News(
      title: json['title'] ?? 'No title', // Pastikan ada nilai default
      description: json['description'] ?? 'No description available',
      url: json['link'] ?? '',
      imageUrl: json['image'] ?? '', // Sesuaikan dengan key API
      publishedAt: DateTime.tryParse(json['pubDate'] ?? '') ??
          DateTime.now(), // Default ke `DateTime.now` jika gagal parse
      category: category,
    );
  }
}
