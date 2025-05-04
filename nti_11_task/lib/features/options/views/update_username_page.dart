import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_11_task/core/helper/get_helper.dart';
import 'package:nti_11_task/features/home/manager/user_cubit/user_cubit.dart';
import 'package:nti_11_task/features/home/manager/user_cubit/user_state.dart';
import 'package:nti_11_task/features/options/manager/update_username_cubit/update_username_cubit.dart';
import '../../auth/views/widgets/main_image.dart';
import '../../../core/widgets/my_custom_button.dart';
import '../../../core/widgets/my_text_form_field.dart';
import '../manager/update_username_cubit/update_username._state.dart';

class UpdateUsernamePage extends StatelessWidget {
  const UpdateUsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateUsernameCubit(),
      child: Builder(
        builder: (context) {
          var cubit = UpdateUsernameCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  MainImage(),
                  Form(
                    key: cubit.formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          MyTextFormField(
                            fieldType: TextFieldType.username,
                            controller: cubit.usernameController,
                          ),

                          SizedBox(height: 30),
                          BlocConsumer<
                            UpdateUsernameCubit,
                            UpdateUsernameState
                          >(
                            listener: (context, state) {
                              if (state is UpdateUsernameSuccessState) {
                                GetHelper.pop();
                              } else if (state is UpdateUsernameErrorState) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.error)),
                                );
                              }
                            },
                            builder: (context, state) {
                              return MyCustomeButton(
                                text: 'Update',
                                isLoading: state is UpdateUsernameLoadingState,
                                onPressed: () {
                                  cubit.updateUsername(UserCubit.get(context));
                                },
                              );
                            },
                          ),
                          SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
