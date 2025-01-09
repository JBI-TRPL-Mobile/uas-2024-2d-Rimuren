import 'dart:io';
import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:template_project/screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  SignupScreen({super.key});

  Future<String> getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/users.csv';
  }

  Future<void> saveToCsv(String name, String email, String password) async {
    final filePath = await getFilePath();
    final file = File(filePath);

    if (!await file.exists()) {
      await file.writeAsString(const ListToCsvConverter().convert([
        ['Name', 'Email', 'Password']
      ]));
    }

    final csvData = <List<String>>[
      [name, email, password]
    ];
    final csv = const ListToCsvConverter().convert(csvData);
    await file.writeAsString('$csv\n', mode: FileMode.append);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Sign up',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            hintText: 'Full Name',
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Enter Email',
                            hintText: 'yourmail@gmail.com',
                            hintStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.6),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon: Icon(Icons.visibility_off),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Confirm',
                            suffixIcon: Icon(Icons.visibility_off),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () async {
                            final name = nameController.text;
                            final email = emailController.text;
                            final password = passwordController.text;
                            final confirmPassword = confirmPasswordController.text;

                            if (name.isEmpty ||
                                email.isEmpty ||
                                password.isEmpty ||
                                confirmPassword.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('All fields are required!')),
                              );
                              return;
                            }

                            if (password != confirmPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Passwords do not match!')),
                              );
                              return;
                            }

                            await saveToCsv(name, email, password);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Account created successfully!')),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Sign up',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Expanded(child: Divider(thickness: 1)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text('or sign in with'),
                            ),
                            Expanded(child: Divider(thickness: 1)),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.g_mobiledata, size: 40),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.facebook, size: 40),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'Sign In Now',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
