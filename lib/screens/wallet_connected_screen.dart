import 'package:flutter/material.dart';
import 'package:house_swipe_app/screens/home_screen.dart';
import 'package:house_swipe_app/utils/theme.dart';

class WalletConnectedScreen extends StatelessWidget {
  final String walletType;

  const WalletConnectedScreen({
    super.key,
    required this.walletType,
  });

  String getWalletImagePath() {
    switch (walletType) {
      case 'MetaMask':
        return 'assets/images/MetaMask.png';
      case 'Coinbase':
        return 'assets/images/Coinbase.png';
      case 'WalletConnect':
        return 'assets/images/WalletConnect.png';
      case 'Phantom':
        return 'assets/images/Phantom.png';
      case 'Zerion':
        return 'assets/images/Zerion.png';
      case 'Ronin':
        return 'assets/images/Ronin.png';
      case 'BitKeep':
        return 'assets/images/BitKeep.png';
      case 'Kaikas':
        return 'assets/images/Kaikas.png';
      case 'Core':
        return 'assets/images/Core.png';
      case 'Fortmatic':
        return 'assets/images/Fortmatic.png';
      case 'Bitski':
        return 'assets/images/Bitski.png';
      case 'OperaTouch':
        return 'assets/images/OperaTouch.png';
      case 'Trust':
        return 'assets/images/Trust.png';
      default:
        return 'assets/images/MetaMask.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Wallet Connected Successfully!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.titleColor,
                    height: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Icon(
                  Icons.verified_rounded,
                  color: const Color.fromARGB(255, 45, 70, 113),
                  size: 60,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Flexible(
              child: Container(
                width: 350,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color(0xFFC1CADA),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      getWalletImagePath(),
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      'Welcome to HomeApp',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.titleColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Container(
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(138, 81, 96, 122),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              color: AppColors.titleColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
