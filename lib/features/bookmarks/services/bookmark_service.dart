// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class BookmarkService {
//   static List<Map<String, dynamic>> _bookmarkedItems = [];

//   // Initialize bookmarked items from SharedPreferences
//   static Future<void> initialize() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedBookmarks = prefs.getStringList('bookmarks');
//     if (savedBookmarks != null) {
//       _bookmarkedItems = savedBookmarks
//           .map((item) => jsonDecode(item) as Map<String, dynamic>)
//           .toList();
//     }
//   }

//   // Add a news item to bookmarks
//   static Future<void> addBookmark(Map<String, dynamic> item) async {
//     final prefs = await SharedPreferences.getInstance();
//     if (!_bookmarkedItems
//         .any((bookmark) => bookmark['title'] == item['title'])) {
//       _bookmarkedItems.add(item);
//       prefs.setStringList(
//         'bookmarks',
//         _bookmarkedItems.map((e) => jsonEncode(e)).toList(),
//       );
//     }
//   }

//   // Remove a news item from bookmarks
//   static Future<void> removeBookmark(String title) async {
//     final prefs = await SharedPreferences.getInstance();
//     _bookmarkedItems.removeWhere((item) => item['title'] == title);
//     prefs.setStringList(
//       'bookmarks',
//       _bookmarkedItems.map((e) => jsonEncode(e)).toList(),
//     );
//   }

//   // Get all bookmarked items
//   static List<Map<String, dynamic>> getBookmarkedItems() {
//     return _bookmarkedItems;
//   }
// }
