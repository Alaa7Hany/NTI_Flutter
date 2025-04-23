import 'package:flutter/material.dart';
import 'package:nti_06_task/my_text_form_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  int? selectedGender = 0;
  bool rememberMe = false;
  bool showPass = true;

  bool visibality() {
    return showPass;
  }

  void onChangeVisibality() {
    setState(() {
      showPass = !showPass;
    });
  }

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
                      onChangeVisibality: onChangeVisibality,
                      visibality: visibality,
                      controller: passwordController,
                    ),
                    SizedBox(height: 15),
                    MyTextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                      passController: passwordController,
                      isConfirmPass: true,
                      hint: 'Confirm Password',
                      onChangeVisibality: onChangeVisibality,
                      visibality: visibality,
                      controller: confirmPassController,
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(
                          width: 140,

                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),

                              fillColor: Colors.white,
                              filled: true,
                            ),
                            dropdownColor: Colors.white,
                            value: selectedGender,
                            items: [
                              DropdownMenuItem(value: 0, child: Text('Male')),
                              DropdownMenuItem(value: 1, child: Text('Female')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                        ),
                        Spacer(),
                        Text('Remember me?'),
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value!;
                            });
                          },
                          fillColor: WidgetStateProperty.resolveWith<Color>((
                            states,
                          ) {
                            if (states.contains(WidgetState.selected)) {
                              return Colors.green;
                            }
                            return Colors.transparent;
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
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
