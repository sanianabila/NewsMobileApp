import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_section_item.dart';
import 'package:bacanews/core/theme_provider.dart';
import 'edit_account_page.dart'; // Impor halaman EditAccountPage
import '../provider/profile_provider.dart'; // Import ProfileProvider

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Theme.of(context).textTheme.headlineSmall?.color,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header Section
            Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                return ProfileHeader(
                  name: profileProvider.name, // Tanpa null-aware operator
                  email: profileProvider.email, // Tanpa null-aware operator
                  avatarPath: profileProvider.profileImage != null
                      ? profileProvider.profileImage!.path
                      : 'assets/images/ava/wanita 1.png', // Gambar default
                );
              },
            ),

            const SizedBox(height: 20),

            // Setting Theme Section
            Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // "Setting Theme" Section Title
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      'Setting Theme',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headlineSmall?.color,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.brightness_6,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    title: const Text('Dark Mode'),
                    trailing: Switch(
                      value: themeProvider.isDarkMode,
                      activeColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.blue // Warna biru untuk tema gelap
                              : Theme.of(context)
                                  .primaryColor, // Warna utama tema terang
                      onChanged: (value) {
                        themeProvider.toggleTheme(value);
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Account Section
            Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // "Account" Section Title
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      'Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.headlineSmall?.color,
                      ),
                    ),
                  ),
                  ProfileSectionItem(
                    title: 'Edit Account',
                    icon: Icons.edit, // Ikon untuk Edit Account
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditAccountPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Privacy Section (Jika ada)
          ],
        ),
      ),
    );
  }
}
