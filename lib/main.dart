import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:house_swipe_app/providers/dislike_manager.dart';
import 'package:house_swipe_app/providers/favorite_manager.dart';
import 'package:house_swipe_app/providers/house_manager.dart';
import 'package:house_swipe_app/providers/saved_manager.dart';
import 'package:house_swipe_app/screens/home_screen.dart';
import 'package:house_swipe_app/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

// void main() {
//   runApp(
    // DevicePreview(
    //   enabled: false,
    //   builder: (context) => const MyApp(),
    // ),
//     ChangeNotifierProvider(
//       create: (context) => FavoriteManager(),
//       child: const MyApp(),
//     ),
//   );
// }

// main.dart
void main() {
  runApp(
    
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HouseManager()),
        ChangeNotifierProvider(create: (_) => FavoriteManager()),
        ChangeNotifierProvider(create: (_) => DislikeManager()),
         ChangeNotifierProvider(create: (_) => SavedManager()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const WelcomeScreen(),
      home: const HomeScreen(),

      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
