import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/signup_cubit/signup_cubit.dart';
import '../manager/signup_cubit/signup_state.dart';
import 'widgets/my_gender_drodown_menue.dart';
import '../../home/views/home_page.dart';
import 'login_page.dart';
import '../../../core/utils/app_colors.dart';
import 'widgets/main_image.dart';
import '../../../core/widgets/my_custom_button.dart';
import 'widgets/my_footer.dart';
import '../../../core/widgets/my_text_form_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            var cubit = SignupCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  MainImage(),
                  Form(
                    key: cubit.formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          MyTextFormField(
                            fieldType: TextFieldType.username,
                            controller: cubit.usernameController,
                          ),
                          SizedBox(height: 15),
                          BlocBuilder<SignupCubit, SignupState>(
                            buildWhen: (previous, current) {
                              return current is SignupShowPassState;
                            },
                            builder: (context, state) {
                              return MyTextFormField(
                                fieldType: TextFieldType.password,
                                onSuffixPressed: cubit.onChangeVisibalityPresed,
                                controller: cubit.passwordController,
                                obsecureText: cubit.visibality,
                              );
                            },
                          ),
                          SizedBox(height: 15),
                          BlocBuilder<SignupCubit, SignupState>(
                            buildWhen: (previous, current) {
                              return current is SignupShowPassState;
                            },
                            builder: (context, state) {
                              log('confirm');
                              return MyTextFormField(
                                fieldType: TextFieldType.confirmPasword,
                                obsecureText: cubit.visibality,
                                passController: cubit.passwordController,
                                onSuffixPressed: cubit.onChangeVisibalityPresed,
                                controller: cubit.confirmPassController,
                              );
                            },
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              MyGenderDrodownMenue(cubit: cubit),
                              Spacer(),
                              Text(
                                'Remember me?',
                                style: const TextStyle(
                                  color: AppColors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              BlocBuilder<SignupCubit, SignupState>(
                                buildWhen: (previous, current) {
                                  return current is SignupRememberMeState;
                                },
                                builder: (context, state) {
                                  log('checked');
                                  return Checkbox(
                                    value: cubit.rememberMe,
                                    onChanged: (value) {
                                      cubit.onChangeRememberMe();
                                    },
                                    fillColor:
                                        WidgetStateProperty.resolveWith<Color>((
                                          states,
                                        ) {
                                          if (states.contains(
                                            WidgetState.selected,
                                          )) {
                                            return AppColors.primaryColor;
                                          }
                                          return Colors.transparent;
                                        }),
                                    checkColor: Colors.white,
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          BlocConsumer<SignupCubit, SignupState>(
                            listener: (context, state) {
                              if (state is SignupSuccess) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              } else if (state is SignupError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Signup Failed'),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              return MyCustomeButton(
                                isLoading: state is SignupLoading,
                                text: 'Register',
                                onPressed: () {
                                  cubit.onSignupPressed();
                                },
                              );
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
            );
          },
        ),
      ),
    );
  }
}
