import 'package:flutter/material.dart';

class DiscoverSearchBar extends StatelessWidget {
  final ValueChanged<String> onSearchSubmitted;

  const DiscoverSearchBar({Key? key, required this.onSearchSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the current theme mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: isDarkMode
              ? Colors.grey[800]
              : Colors.grey[200], // Background color adjusts for dark mode
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Icon(
              Icons.search,
              color: isDarkMode
                  ? Colors.grey[400]
                  : Colors.grey, // Search icon color changes
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                onSubmitted: onSearchSubmitted,
                style: TextStyle(
                  color: isDarkMode
                      ? Colors.white
                      : Colors.black, // Text color based on theme
                ),
                decoration: InputDecoration(
                  hintText: 'Search by title or category',
                  hintStyle: TextStyle(
                    color: isDarkMode
                        ? Colors.grey[500]
                        : Colors.grey, // Hint text color adjusts for dark mode
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              icon: const Icon(Icons.tune),
              onPressed: () {},
              color: isDarkMode
                  ? Colors.white
                  : Colors.black, // Icon color for filter button
            ),
          ],
        ),
      ),
    );
  }
}
