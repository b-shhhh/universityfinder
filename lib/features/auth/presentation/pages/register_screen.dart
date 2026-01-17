import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/constants/hive_boxes.dart';
import '../../../../core/routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const Color bgColor = Color(0xFF062A8F);
  static const Color buttonColor = Color(0xFF060A6F);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final countryController = TextEditingController();
  final educationController = TextEditingController();

  String? _registerError;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    countryController.dispose();
    educationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RegisterScreen.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Image.asset('assets/images/uniguide_logo.png', height: 80),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Sign up to your',
                      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Account',
                      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Enter your personal details to create your account',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 40),
                _buildInputField('Full Name', nameController),
                const SizedBox(height: 15),
                _buildInputField('Email', emailController, keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 15),
                _buildInputField('Password', passwordController, obscureText: true),
                const SizedBox(height: 15),
                _buildInputField('Country / Region', countryController),
                const SizedBox(height: 15),
                _buildInputField('Education', educationController),
                const SizedBox(height: 20),

                if (_registerError != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      _registerError!,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        // ✅ Use already opened box
                        var box = Hive.box(HiveBoxes.userBox);

                        await box.put('currentUser', {
                          'name': nameController.text,
                          'email': emailController.text,
                          'password': passwordController.text,
                          'country': countryController.text,
                          'education': educationController.text,
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('User Registered Successfully')),
                        );

                        Navigator.pushReplacementNamed(context, AppRoutes.login);
                      } catch (e) {
                        setState(() => _registerError = 'Failed to save user: $e');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: RegisterScreen.buttonColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.login);
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.white70),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String hint, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black45),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      ),
    );
  }
}
