import 'package:flutter/material.dart';
import 'package:universityfinder/features/auth/presentation/pages/login_screen.dart';
import 'package:universityfinder/features/dashboard/bottom_screen/home_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => RegisterScreen();
}

class RegisterScreen extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final phoneController = TextEditingController();
  final educationController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  String? selectedGender;
  final List<String> genders = ['Male', 'Female', 'Other'];

  bool _isLoading = false; // for loading indicator

  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final url = Uri.parse('http://10.0.2.2:3000/auth/register'); // replace with your backend URL
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "email": emailController.text,
          "password": passwordController.text,
          "dob": dobController.text,
          "gender": selectedGender,
          "phone": phoneController.text,
          "education": educationController.text,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Navigate to HomeScreen after successful signup
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        final error = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error['message'] ?? 'Registration failed')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF082A78),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Row(
                  children: const [
                    Icon(Icons.school, color: Colors.white, size: 28),
                    SizedBox(width: 8),
                    Text(
                      "UniGuide",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Title
                const Text(
                  "Create Your Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Enter your details to get started",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 32),

                // Fields
                buildField("First Name", firstNameController),
                const SizedBox(height: 16),
                buildField("Last Name", lastNameController),
                const SizedBox(height: 16),
                buildField("Email", emailController, keyboard: TextInputType.emailAddress),
                const SizedBox(height: 16),

                // DOB + Gender
                Row(
                  children: [
                    Expanded(
                      child: buildField(
                        "MM/DD/YYYY",
                        dobController,
                        readOnly: true,
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (date != null) {
                            dobController.text = "${date.month}/${date.day}/${date.year}";
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        dropdownColor: const Color(0xFF082A78),
                        value: selectedGender,
                        hint: const Text(
                          "Gender",
                          style: TextStyle(color: Colors.white70),
                        ),
                        iconEnabledColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: inputDecoration(),
                        items: genders
                            .map((g) => DropdownMenuItem(
                          value: g,
                          child: Text(g),
                        ))
                            .toList(),
                        onChanged: (v) => setState(() => selectedGender = v),
                        validator: (v) => v == null ? "Required" : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                buildField("Phone", phoneController, keyboard: TextInputType.phone),
                const SizedBox(height: 16),
                buildField("Education", educationController),
                const SizedBox(height: 16),

                // Password
                buildPasswordField(
                  "Password",
                  passwordController,
                  obscurePassword,
                      () => setState(() => obscurePassword = !obscurePassword),
                ),
                const SizedBox(height: 16),

                // Confirm Password
                buildPasswordField(
                  "Confirm Password",
                  confirmPasswordController,
                  obscureConfirmPassword,
                      () => setState(() => obscureConfirmPassword = !obscureConfirmPassword),
                  confirm: true,
                ),
                const SizedBox(height: 32),

                // Signup Button
                SizedBox(
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : registerUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A8DFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Already have an account
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? ", style: TextStyle(color: Colors.white70)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const LoginPage()),
                          );
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Normal Field
  Widget buildField(
      String hint,
      TextEditingController controller, {
        TextInputType keyboard = TextInputType.text,
        bool readOnly = false,
        VoidCallback? onTap,
      }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboard,
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(color: Colors.white),
      decoration: inputDecoration(hint: hint),
      validator: (v) => v == null || v.isEmpty ? "Required" : null,
    );
  }

  // Password Field
  Widget buildPasswordField(
      String hint,
      TextEditingController controller,
      bool obscure,
      VoidCallback toggle, {
        bool confirm = false,
      }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: inputDecoration(hint: hint).copyWith(
        suffixIcon: IconButton(
          icon: Icon(obscure ? Icons.visibility_off : Icons.visibility, color: Colors.white70),
          onPressed: toggle,
        ),
      ),
      validator: (v) {
        if (v == null || v.isEmpty) return "Required";
        if (confirm && v != passwordController.text) return "Passwords do not match";
        return null;
      },
    );
  }

  // Input Decoration
  InputDecoration inputDecoration({String? hint}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white70),
      filled: true,
      fillColor: const Color(0xFF0A3B9E),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white54),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.white),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    );
  }
}
