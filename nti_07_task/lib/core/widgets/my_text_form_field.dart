import 'package:flutter/material.dart';
import 'package:nti_06_task/core/utils/app_text_styles.dart';

import '../wrapper/svg_wrapper.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.fieldType,
    required this.controller,
    this.passController,
    this.obsecureText = true,
    this.onChangeVisibality,
  });
  final TextEditingController controller;
  final TextEditingController? passController;
  final bool obsecureText;
  final void Function()? onChangeVisibality;
  final TextFieldType fieldType;

  @override
  Widget build(BuildContext context) {
    switch (fieldType) {
      case TextFieldType.username:
        return _usernameTextField();
      case TextFieldType.password:
        return _passwordTextField();
      case TextFieldType.confirmPasword:
        return _passwordTextField(isConfirmPass: true);
      case TextFieldType.taskTitle:
        return _normalTextField(hint: 'Title');
      case TextFieldType.taskDescribtion:
        return _normalTextField(hint: 'Describtion');
      default:
        return _normalTextField();
    }
  }

  Widget _usernameTextField() {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppTextStyles.s14w300,
      validator: _validateUsername,
      decoration: _myInputDecoration(
        prefixIconPath: AppAssets.profile,
        hint: 'Username',
      ),
    );
  }

  Widget _passwordTextField({bool isConfirmPass = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppTextStyles.s14w300,
      validator: isConfirmPass ? _validateConfirmPass : _validatePassword,
      decoration: _myInputDecoration(
        prefixIconPath: AppAssets.password,
        suffixIconPath: obsecureText ? AppAssets.lock : AppAssets.unlock,
        onSuffixIconPressed: onChangeVisibality,
        hint: isConfirmPass ? 'Confirm Password' : 'Password',
      ),
      obscureText: obsecureText,
    );
  }

  Widget _normalTextField({String? hint}) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppTextStyles.s14w300,
      validator: _noValidation,
      decoration: _myInputDecoration(hint: hint),
    );
  }

  /////////////////////////////////////////////////////////////////////////
  // --------------> Decorations <---------------

  InputBorder _myInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: borderColor, width: 2),
    );
  }

  InputDecoration _myInputDecoration({
    String? prefixIconPath,
    String? suffixIconPath,
    void Function()? onSuffixIconPressed,
    String? hint,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: AppColors.grey,
        fontWeight: FontWeight.w200,
        fontSize: 14,
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 20,
          width: 20,
          child:
              prefixIconPath != null
                  ? SvgWrappe(assetName: prefixIconPath)
                  : null,
        ),
      ),
      suffixIcon:
          suffixIconPath != null
              ? IconButton(
                onPressed: onSuffixIconPressed,
                icon: SvgWrappe(assetName: suffixIconPath),
              )
              : null,
      enabledBorder: _myInputBorder(AppColors.lightGrey),
      errorBorder: _myInputBorder(Colors.red),
      focusedErrorBorder: _myInputBorder(Colors.red),
      focusedBorder: _myInputBorder(Colors.green),
      disabledBorder: _myInputBorder(Colors.grey),
      fillColor: Colors.white,
      filled: true,
    );
  }

  ////////////////////////////////////////////////////////////////////////////////
  // ---------> Validations <--------------
  String? _validatePassword(String? value) {
    final passwordRegEx = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (!passwordRegEx.hasMatch(value)) {
      return 'Password must be at least 8 characters, include letters and numbers';
    }
    return null;
  }

  String? _validateConfirmPass(String? value) {
    print('Confirm: $value, Original: ${passController?.text}');
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (passController == null || passController!.text != value) {
      return 'Password not matched';
    }
    return null;
  }

  String? _validateUsername(String? value) {
    final usernameRegEx = RegExp(r'^[a-zA-Z0-9_]{3,16}$');
    if (value == null || value.isEmpty) {
      return 'Username is required';
    } else if (!usernameRegEx.hasMatch(value)) {
      return 'Username must be 3-16';
    }
    return null;
  }

  String? _noValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }
}

enum TextFieldType {
  username,
  password,
  confirmPasword,
  taskTitle,
  taskDescribtion,
  normal,
}
