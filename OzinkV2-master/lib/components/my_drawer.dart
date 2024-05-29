import 'my_drawer_tile.dart';
import '../pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivtute/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  // logout button
  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Image.asset(
                  'lib/images/logo/logo.png', // replace with your image file path
                  height: 200, width: 200,
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          // home list tile
          MyDrawerTile(
            text: "Trang Chủ",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          // Setting list tile
          MyDrawerTile(
            text: "Cài Đặt",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                )
              );
            },
          ),

          const Spacer(),

          // Logout list tile
          MyDrawerTile(
            text: "Đăng Xuất",
            icon: Icons.logout,
            onTap: logout,
          ),

          const SizedBox(height: 25),

        ],
      ),
    );
  }
}
