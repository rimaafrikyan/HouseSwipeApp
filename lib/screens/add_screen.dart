import 'package:flutter/material.dart';
import 'package:house_swipe_app/utils/theme.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.backgroundColor,
      body: Center(
      child: Text("Add home"),
      ),
    );
  
  }
}