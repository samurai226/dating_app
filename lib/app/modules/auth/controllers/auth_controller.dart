import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final registerFormKey = GlobalKey<FormState>();
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  
  final isLoading = false.obs;
  final isPasswordVisible = false.obs;
  
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
  
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
  
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }
  
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }
  
  Future<void> login() async {
    if (loginFormKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      try {
        // TODO: Implement actual login logic
        await Future.delayed(const Duration(seconds: 2)); // Simulate API call
        Get.offAllNamed('/home');
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to login. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }
  
  Future<void> register() async {
    if (registerFormKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      try {
        // TODO: Implement actual registration logic
        await Future.delayed(const Duration(seconds: 2)); // Simulate API call
        Get.offAllNamed('/home');
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to register. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }
  
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    super.onClose();
  }
} 