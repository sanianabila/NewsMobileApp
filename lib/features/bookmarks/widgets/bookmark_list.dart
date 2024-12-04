// import 'package:flutter/material.dart';
// import 'bookmark_list_item.dart';

// class BookmarksList extends StatelessWidget {
//   final List<Map<String, dynamic>> bookmarkedItems;

//   const BookmarksList({Key? key, required this.bookmarkedItems})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         (context, index) {
//           final item = bookmarkedItems[index];
//           return BookmarkListItem(
//             imageUrl: item['imageUrl']!,
//             title: item['title']!,
//             author: item['author']!,
//             category: item['category']!,
//             date: DateTime.parse(item['date']!),
//             content: item['content']!,
//             link: item['link']!, // Ensure link is passed
//           );
//         },
//         childCount: bookmarkedItems.length,
//       ),
//     );
//   }
// }
