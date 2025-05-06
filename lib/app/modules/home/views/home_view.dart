import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: controller.currentIndex.value,
        children: [
          _buildDiscoverPage(),
          _buildMatchesPage(),
          _buildChatsPage(),
          _buildProfilePage(),
        ],
      )),
      bottomNavigationBar: Obx(() => NavigationBar(
        selectedIndex: controller.currentIndex.value,
        onDestinationSelected: controller.changePage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Matches',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      )),
    );
  }

  Widget _buildDiscoverPage() {
    return const Center(
      child: Text('Discover Page'),
    );
  }

  Widget _buildMatchesPage() {
    return const Center(
      child: Text('Matches Page'),
    );
  }

  Widget _buildChatsPage() {
    return const Center(
      child: Text('Chats Page'),
    );
  }

  Widget _buildProfilePage() {
    return const Center(
      child: Text('Profile Page'),
    );
  }
}
