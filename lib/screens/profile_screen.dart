import 'package:flutter/material.dart';
import 'package:house_swipe_app/utils/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
      child: Text("Profile"),
      ),
    );
  }
}