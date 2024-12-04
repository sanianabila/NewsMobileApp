// import 'package:flutter/material.dart';
// import 'package:bacanews/features/home/pages/single_news_item_page.dart';
// import 'package:bacanews/theme/colors.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import '../../../core/utils/app_date_formatters.dart';

// class BookmarkListItem extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String author;
//   final String category;
//   final DateTime date;
//   final String content;
//   final String link; // Add link field here

//   const BookmarkListItem({
//     Key? key,
//     required this.imageUrl,
//     required this.title,
//     required this.author,
//     required this.category,
//     required this.date,
//     required this.content,
//     required this.link, // Add this to constructor
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigasi ke halaman detail berita saat item diklik
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => SingleNewsItemPage(
//               title: title,
//               content: content,
//               author: author,
//               category: category,
//               authorImageAssetPath: imageUrl,
//               imageUrl: imageUrl,
//               date: date,
//               link: link, // Pass link parameter here
//             ),
//           ),
//         );
//       },
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 5, 20, 16),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Thumbnail berita
//             ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: CachedNetworkImage(
//                 imageUrl: imageUrl,
//                 width: 100,
//                 height: 100,
//                 fit: BoxFit.cover,
//                 placeholder: (context, url) => const Center(
//                   child: CircularProgressIndicator(),
//                 ),
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//               ),
//             ),
//             const SizedBox(width: 15),

//             // Informasi berita
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Kategori berita
//                   Text(
//                     category,
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodySmall
//                         ?.copyWith(color: AppColors.osloGray),
//                   ),
//                   const SizedBox(height: 8),

//                   // Judul berita
//                   Text(
//                     title,
//                     style: Theme.of(context).textTheme.headlineSmall?.copyWith(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                   const SizedBox(height: 8),

//                   // Penulis dan tanggal
//                   Text(
//                     '$author · ${AppDateFormatters.mdY(date)}',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodySmall
//                         ?.copyWith(color: AppColors.osloGray),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
