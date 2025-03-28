import 'package:flutter/material.dart';
import 'package:house_swipe_app/screens/home_screen.dart';
import 'package:house_swipe_app/services/api_service.dart';
import 'package:house_swipe_app/utils/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
                  _buildTextField('Full Name', false, fullNameController),
                  _buildTextField('Email', false, emailController),
                  _buildTextField('Password', true, passwordController),
                  _buildTextField(
                      'Repeat a password', true, confirmPasswordController),
                  _buildSignInButton(),
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
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.primaryColor,
                size: 28,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      String labelText, bool isPassword, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword
            ? (labelText == 'Password'
                ? !isPasswordVisible
                : !isConfirmPasswordVisible)
            : false,
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
                    (labelText == 'Password'
                            ? isPasswordVisible
                            : isConfirmPasswordVisible)
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      if (labelText == 'Password') {
                        isPasswordVisible = !isPasswordVisible;
                      } else {
                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                      }
                    });
                  },
                )
              : null,
        ),
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
            if (_formSignInKey.currentState!.validate()) {
              final response = await ApiService.signUp(
                fullNameController.text,
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
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(174, 123, 134, 158),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
          ),
          child: const Text(
            'Sign up',
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
}
