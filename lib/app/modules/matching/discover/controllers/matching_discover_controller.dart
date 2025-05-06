import 'package:get/get.dart';

class MatchingDiscoverController extends GetxController {
  final profiles = <Profile>[].obs;
  final currentIndex = 0.obs;
  final isLoading = false.obs;
  final isSwiping = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfiles();
  }

  void loadProfiles() {
    // TODO: Load profiles from API
    profiles.value = [
      Profile(
        id: '1',
        name: 'Sarah',
        age: 28,
        distance: 5,
        bio: 'Love traveling and trying new foods. Looking for someone to share adventures with!',
        images: [
          'https://randomuser.me/api/portraits/women/1.jpg',
          'https://randomuser.me/api/portraits/women/2.jpg',
          'https://randomuser.me/api/portraits/women/3.jpg',
        ],
        interests: ['Travel', 'Food', 'Photography', 'Hiking'],
      ),
      Profile(
        id: '2',
        name: 'Mike',
        age: 30,
        distance: 3,
        bio: 'Tech enthusiast and coffee lover. Let\'s grab a cup and chat!',
        images: [
          'https://randomuser.me/api/portraits/men/1.jpg',
          'https://randomuser.me/api/portraits/men/2.jpg',
          'https://randomuser.me/api/portraits/men/3.jpg',
        ],
        interests: ['Technology', 'Coffee', 'Reading', 'Gaming'],
      ),
    ];
  }

  void likeProfile() {
    if (currentIndex.value < profiles.length) {
      final profile = profiles[currentIndex.value];
      // TODO: Send like to API
      Get.snackbar(
        'Liked',
        'You liked ${profile.name}!',
        snackPosition: SnackPosition.BOTTOM,
      );
      moveToNextProfile();
    }
  }

  void dislikeProfile() {
    if (currentIndex.value < profiles.length) {
      moveToNextProfile();
    }
  }

  void moveToNextProfile() {
    if (currentIndex.value < profiles.length - 1) {
      currentIndex.value++;
    } else {
      // TODO: Load more profiles or show end of list
      Get.snackbar(
        'No more profiles',
        'Come back later for more matches!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void onSwipeStart() {
    isSwiping.value = true;
  }

  void onSwipeEnd() {
    isSwiping.value = false;
  }
}

class Profile {
  final String id;
  final String name;
  final int age;
  final int distance;
  final String bio;
  final List<String> images;
  final List<String> interests;

  Profile({
    required this.id,
    required this.name,
    required this.age,
    required this.distance,
    required this.bio,
    required this.images,
    required this.interests,
  });
}
