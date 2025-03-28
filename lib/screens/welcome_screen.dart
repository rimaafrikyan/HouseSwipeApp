import 'package:flutter/material.dart';
import 'package:house_swipe_app/screens/sign_in_screen.dart';
import 'package:house_swipe_app/utils/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

// void _onLanguageSelected(String language){
//   print('Selected language: $language');
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/bg_img.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            // child: PopupMenuButton<String>(

            child: Icon(
              Icons.language,
              size: 48,
              color: AppColors.primaryColor,
            ),
            // onSelected: _onLanguageSelected,
            // itemBuilder: (BuildContext context){
            //    return [
            //     const PopupMenuItem<String>(
            //       value: 'English', child: Text('English')),
            //     const PopupMenuItem<String>(
            //         value: 'Armenian', child: Text('Հայերեն')),
            //     const PopupMenuItem<String>(
            //         value: 'Russian', child: Text('Русский')),
            //   ];
            // },
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: AppColors.titleColor,
                    ),
                  ),
                  Text(
                    "Swipe to find your dream home",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.titleColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen()),
                        );
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(128, 32, 49, 77),
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: AppColors.titleColor,
                        ),
                      )),
                  // SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: (){},
                  //   child: Text(
                  //     'Get Started',
                  //     ),
                  //      style: ElevatedButton.styleFrom(
                  //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  // ),
                  //   ),
                ],
              ),
            ),
          )
          // )
        ],
      ),
    );
  }
}
