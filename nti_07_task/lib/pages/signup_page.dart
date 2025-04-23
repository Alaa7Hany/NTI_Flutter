import 'package:flutter/material.dart';
import 'package:nti_06_task/pages/login_page.dart';
import 'package:nti_06_task/utils/app_colors.dart';
import 'package:nti_06_task/widgets/main_image.dart';
import 'package:nti_06_task/widgets/my_custom_button.dart';
import 'package:nti_06_task/widgets/my_footer.dart';
import 'package:nti_06_task/widgets/my_text_form_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  int? selectedGender = 0;
  bool rememberMe = false;
  bool showPass = true;
  final _formKey = GlobalKey<FormState>();

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
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainImage(),
            Form(
              key: _formKey,
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
                                  color: AppColors.lightGrey,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: AppColors.lightGrey,
                                  width: 2,
                                ),
                              ),

                              fillColor: AppColors.white,
                              filled: true,
                            ),
                            dropdownColor: AppColors.white,
                            value: selectedGender,
                            items: [
                              DropdownMenuItem(value: 0, child: Text('Male')),
                              DropdownMenuItem(value: 1, child: Text('Female')),
                            ],
                            style: const TextStyle(
                              color: AppColors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                            onChanged: (value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Remember me?',
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
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
                              return AppColors.primaryColor;
                            }
                            return Colors.transparent;
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    MyCustomeButton(
                      text: 'Register',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill all fields'),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 25),
                    MyFooter(
                      title: 'Already Have An Account?',
                      action: 'Login',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 30),
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
