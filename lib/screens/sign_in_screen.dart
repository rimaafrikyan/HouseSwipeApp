import 'package:flutter/material.dart';
import 'package:house_swipe_app/screens/home_screen.dart';
import 'package:house_swipe_app/screens/sign_up_screen.dart';
import 'package:house_swipe_app/services/api_service.dart';
import 'package:house_swipe_app/utils/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  bool isPasswordVisible = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                _buildWelcomeText(),
                _buildSignInForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeText() {
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

  Widget _buildSignInForm() {
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
            child: Form(
              key: _formSignInKey,
              child: Column(
                children: [
                  _buildSignInTitle(),
                  _buildTextField('Email', false, emailController),
                  _buildTextField('Password', true, passwordController),
                  _buildRememberMeAndForgotPassword(),
                  _buildSignInButton(),
                  _buildSignUpPrompt(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        'Sign in',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  Widget _buildTextField(
      String labelText, bool isPassword, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword && !isPasswordVisible,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $labelText';
          }
          if (labelText == 'Email' && !value.contains('@')) {
            return 'Please enter a valid email';
          }
          if (labelText == 'Password' && value.length < 8) {
            return 'Password must be at least 8 characters long';
          }
          if (labelText == 'Repeat a password' &&
              value != passwordController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelStyle: TextStyle(
            color: Color.fromARGB(172, 23, 28, 39),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color.fromARGB(174, 123, 134, 158)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color.fromARGB(174, 123, 134, 158)),
          ),
          filled: true,
          fillColor: Color.fromARGB(174, 123, 134, 158),
            suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible; 
                  });
                },
              )
            : null,
        ),
      ),
    );
  }

  Widget _buildRememberMeAndForgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                value: rememberPassword,
                onChanged: (bool? value) {
                  setState(() {
                    rememberPassword = value!;
                  });
                },
                activeColor: AppColors.primaryColor,
              ),
              Text(
                'Remember me',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Forget password?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () async {
            if (_formSignInKey.currentState!.validate() && rememberPassword) {
              final response = await ApiService.signIn(
                emailController.text,
                passwordController.text,
              );

              if (response['success'] == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(response['message'])),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(response['message'])),
                );
              }
            } else if (!rememberPassword) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content:
                      Text('Please agree to the processing of personal data'),
                ),
              );
            }
          },
          //   onPressed: ()  {
            
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const HomeScreen(),
          //         ),
          //       );
              
          // },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(174, 123, 134, 158),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
          ),
          child: const Text(
            'Sign in',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.titleColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpPrompt() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Don\'t have an account? ',
            style: TextStyle(
              color: Colors.black45,
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                );
              },
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
