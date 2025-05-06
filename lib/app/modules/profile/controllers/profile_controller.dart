import 'package:get/get.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;
  final isEditing = false.obs;
  final user = Rx<UserProfile?>(null);

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  void loadUserProfile() {
    // TODO: Load user profile from API
    user.value = UserProfile(
      id: '1',
      name: 'John Doe',
      age: 28,
      bio: 'Love traveling and trying new foods. Looking for someone to share adventures with!',
      images: [
        'https://randomuser.me/api/portraits/men/1.jpg',
        'https://randomuser.me/api/portraits/men/2.jpg',
        'https://randomuser.me/api/portraits/men/3.jpg',
      ],
      interests: ['Travel', 'Food', 'Photography', 'Hiking'],
      location: 'New York, USA',
      job: 'Software Engineer',
      education: 'Master\'s in Computer Science',
      height: 180,
      lookingFor: ['Friendship', 'Long-term relationship'],
      settings: UserSettings(
        showAge: true,
        showDistance: true,
        notifications: true,
        darkMode: false,
      ),
    );
  }

  void toggleEditMode() {
    isEditing.value = !isEditing.value;
  }

  void updateProfile(UserProfile updatedProfile) {
    // TODO: Update profile in API
    user.value = updatedProfile;
    isEditing.value = false;
    Get.snackbar(
      'Success',
      'Profile updated successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void updateSettings(UserSettings settings) {
    // TODO: Update settings in API
    user.value = user.value?.copyWith(settings: settings);
    Get.snackbar(
      'Success',
      'Settings updated successfully',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void logout() {
    // TODO: Implement logout logic
    Get.offAllNamed('/auth/login');
  }
}

class UserProfile {
  final String id;
  final String name;
  final int age;
  final String bio;
  final List<String> images;
  final List<String> interests;
  final String location;
  final String job;
  final String education;
  final int height;
  final List<String> lookingFor;
  final UserSettings settings;

  UserProfile({
    required this.id,
    required this.name,
    required this.age,
    required this.bio,
    required this.images,
    required this.interests,
    required this.location,
    required this.job,
    required this.education,
    required this.height,
    required this.lookingFor,
    required this.settings,
  });

  UserProfile copyWith({
    String? name,
    String? bio,
    List<String>? images,
    List<String>? interests,
    String? location,
    String? job,
    String? education,
    int? height,
    List<String>? lookingFor,
    UserSettings? settings,
  }) {
    return UserProfile(
      id: id,
      name: name ?? this.name,
      age: age,
      bio: bio ?? this.bio,
      images: images ?? this.images,
      interests: interests ?? this.interests,
      location: location ?? this.location,
      job: job ?? this.job,
      education: education ?? this.education,
      height: height ?? this.height,
      lookingFor: lookingFor ?? this.lookingFor,
      settings: settings ?? this.settings,
    );
  }
}

class UserSettings {
  final bool showAge;
  final bool showDistance;
  final bool notifications;
  final bool darkMode;

  UserSettings({
    required this.showAge,
    required this.showDistance,
    required this.notifications,
    required this.darkMode,
  });

  UserSettings copyWith({
    bool? showAge,
    bool? showDistance,
    bool? notifications,
    bool? darkMode,
  }) {
    return UserSettings(
      showAge: showAge ?? this.showAge,
      showDistance: showDistance ?? this.showDistance,
      notifications: notifications ?? this.notifications,
      darkMode: darkMode ?? this.darkMode,
    );
  }
} 