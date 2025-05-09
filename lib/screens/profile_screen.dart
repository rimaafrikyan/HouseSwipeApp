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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize
                .min, 
            mainAxisAlignment:
                MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Padding(
              // padding: const EdgeInsets.only(top: 20),
              CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromARGB(137, 50, 64, 89),
                child: Icon(Icons.person,
                    size: 50, color: const Color.fromARGB(116, 255, 255, 255)),
              ),
              // ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Rima Afrikyan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.overlayColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '0x1234...5675',
                style: TextStyle(
                  color: const Color.fromARGB(255, 64, 73, 82),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 280,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(162, 50, 64, 89),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        'Balance',
                        style: TextStyle(
                            color: AppColors.overlayColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '\$ 1,200.00',
                        style: TextStyle(
                          color: AppColors.overlayColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const _MenuButton(
                icon: Icons.history,
                label: 'Transaction History',
              ),
              const _MenuButton(
                icon: Icons.security,
                label: 'Security',
              ),
              const _MenuButton(
                icon: Icons.settings,
                label: 'Settings',
              ),
              const _MenuButton(
                icon: Icons.logout,
                label: 'Sign Out',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MenuButton({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Color.fromARGB(105, 50, 64, 89),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFFF1C273A)),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Color(0xFFF1C273A)),
          ),
        ],
      ),
    );
  }
}
