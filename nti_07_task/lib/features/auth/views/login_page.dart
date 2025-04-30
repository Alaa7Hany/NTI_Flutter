import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_06_task/features/auth/manager/login_cubit/login_cubit.dart';
import 'package:nti_06_task/features/auth/manager/login_cubit/login_state.dart';
import 'package:nti_06_task/features/home/views/home_page.dart';

import '../../../core/widgets/my_custom_button.dart';
import '../../../core/widgets/my_text_form_field.dart';
import 'signup_page.dart';
import 'widgets/main_image.dart';
import 'widgets/my_footer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: Scaffold(
        body: Builder(
          builder: (context) {
            var cubit = LoginCubit.get(context);
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
                          BlocBuilder<LoginCubit, LoginState>(
                            builder: (context, state) {
                              return MyTextFormField(
                                onChangeVisibality:
                                    () => cubit.onChangeVisibalityPresed(),
                                controller: cubit.passwordController,
                                fieldType: TextFieldType.password,
                                obsecureText: cubit.visibality,
                              );
                            },
                          ),

                          SizedBox(height: 15),
                          BlocConsumer<LoginCubit, LoginState>(
                            listener: (context, state) {
                              if (state is LoginErrorState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Login failed!')),
                                );
                              } else if (state is LoginSuccessState) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              }
                            },
                            builder: (context, state) {
                              return MyCustomeButton(
                                isLoading: state is LoginLoadingState,
                                text: 'Login',
                                onPressed: () {
                                  cubit.onLoginPressed();
                                },
                              );
                            },
                          ),
                          SizedBox(height: 25),
                          MyFooter(
                            title: 'Don\'t Have An Account?',
                            action: 'Register',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupPage(),
                                ),
                              );
                            },
                          ),
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
