import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/routes/app_pages.dart';
import 'app/data/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialiser Hive
  await Hive.initFlutter();
  await Hive.openBox('token');
  await Hive.openBox('user');
  
  // Initialiser les services
  await initServices();
  
  runApp(const DatingApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => StorageService().init());
}

class DatingApp extends StatelessWidget {
  const DatingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dating App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL, // Démarre avec ONBOARDING
      getPages: AppPages.routes,
    );
  }
}