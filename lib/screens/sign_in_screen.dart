import 'package:flutter/material.dart';
import 'package:house_swipe_app/screens/home_screen.dart';
import 'package:house_swipe_app/screens/wallet_connected_screen.dart';
import 'package:house_swipe_app/utils/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final ScrollController _contentScrollController = ScrollController();

  @override
  void dispose() {
    _contentScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                _WelcomeText(),
                _SignInSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _WelcomeText() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Text(
          'WELCOME',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: AppColors.titleColor,
          ),
        ),
      ),
    );
  }

  Widget _SignInSection() {
    return Expanded(
      flex: 4,
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFC1CADA),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(60.0),
              topRight: Radius.circular(60.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _SignInTitle(),
                _Content(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _SignInTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Text(
        'Sign in with your wallet',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  Widget _Content() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Container(
        width: 300,
        height: 400,
        decoration: BoxDecoration(
          color: Color.fromARGB(73, 50, 64, 89),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'Connect Wallet',
                style: TextStyle(
                  fontSize: 25,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  scrollbarTheme: ScrollbarThemeData(
                    thumbColor: MaterialStateProperty.all(
                        Color.fromARGB(73, 50, 64, 89)),
                    trackColor: MaterialStateProperty.all(Colors.grey[300]),
                    thickness: MaterialStateProperty.all(8.0),
                    radius: Radius.circular(4),
                  ),
                ),
                child: Scrollbar(
                  controller: _contentScrollController,
                  thumbVisibility: true,
                  // thickness: 8,
                  // radius: Radius.circular(4),
                  child: SingleChildScrollView(
                    controller: _contentScrollController,
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _WalletOption(
                          'MetaMask',
                          'assets/images/MetaMask.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'MetaMask')),
                            );
                          },
                        ),
                        _WalletOption(
                          'Coinbase Wallet',
                          'assets/images/Coinbase.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'Coinbase')),
                            );
                          },
                        ),
                        _WalletOption(
                          'WalletConnect',
                          'assets/images/WalletConnect.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'WalletConnect')),
                            );
                          },
                        ),
                        _WalletOption(
                          'Phantom',
                          'assets/images/Phantom.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'Phantom')),
                            );
                          },
                        ),
                        _WalletOption(
                          'Zerion',
                          'assets/images/Zerion.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'Zerion')),
                            );
                          },
                        ),
                        _WalletOption(
                          'Ronin',
                          'assets/images/Ronin.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'Ronin')),
                            );
                          },
                        ),
                        _WalletOption(
                          'BitKeep',
                          'assets/images/BitKeep.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'BitKeep')),
                            );
                          },
                        ),
                        _WalletOption(
                          'Kaikas',
                          'assets/images/Kaikas.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'Kaikas')),
                            );
                          },
                        ),
                        _WalletOption(
                          'Core',
                          'assets/images/Core.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'Core')),
                            );
                          },
                        ),
                        _WalletOption(
                          'Fortmatic',
                          'assets/images/Fortmatic.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'Fortmatic')),
                            );
                          },
                        ),
                        _WalletOption(
                          'Bitski',
                          'assets/images/Bitski.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'Bitski')),
                            );
                          },
                        ),
                        _WalletOption(
                          'OperaTouch',
                          'assets/images/OperaTouch.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'OperaTouch')),
                            );
                          },
                        ),
                        _WalletOption(
                          'Trust',
                          'assets/images/Trust.png',
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletConnectedScreen(
                                      walletType: 'Trust')),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _WalletOption(String name, String iconPath, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(108, 50, 64, 89),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  iconPath,
                  width: 40,
                  height: 40,
                ),
                SizedBox(width: 10),
                Text(
                  name,
                  style: TextStyle(
                    color: AppColors.titleColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
