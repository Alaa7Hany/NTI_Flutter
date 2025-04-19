import 'package:flutter/material.dart';
import 'package:nti_06_task/my_text_form_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 200, width: double.infinity, color: Colors.blue),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    MyTextFormField(
                      keyboardType: TextInputType.name,
                      hint: 'Username',
                      controller: usernameController,
                    ),
                    SizedBox(height: 15),
                    MyTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      hint: 'Password',
                      controller: passwordController,
                    ),
                    SizedBox(height: 15),
                    MyTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      hint: 'Confirm Password',
                      controller: confirmPassController,
                    ),
                    SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          elevation: 10,
                          shadowColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(width: 15),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.grey.shade100,
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
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
