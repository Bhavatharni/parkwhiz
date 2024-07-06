import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homepage.dart';
import 'forgetpassword.dart';
import 'createaccount.dart';
import 'MyButton.dart';
import 'MyTextField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        title: Text("LOGIN"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/background.png'), // Replace 'background_image.jpg' with your image file
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back to ParkWhiz",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 30),
                  MyTextField(
                    controller: emailController,
                    icon: Icons.email,
                    label: "Email",
                  ),
                  SizedBox(height: 10),
                  MyTextField(
                    controller: passwordController,
                    icon: Icons.lock,
                    label: "Password",
                    isObscure: true,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(
                              ForgetPasswordPage()); // Navigate to Forgot Password Page
                        },
                        child: Text("Forgot Password?"),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(
                              CreateAccountPage()); // Navigate to Create Account Page
                        },
                        child: Text("Create New Account"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MyButton(
                    icon: Icons.login,
                    text: "LOGIN",
                    onTap: () {
                      // Perform login logic here
                      String email = emailController.text;
                      String password = passwordController.text;
                      // Example: Validate login
                      if (email.isNotEmpty && password.isNotEmpty) {
                        // Navigate to home page
                        Get.offAll(() => homepage());
                      } else {
                        // Show error message
                        Get.snackbar(
                          "Error",
                          "Please enter valid email and password",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
