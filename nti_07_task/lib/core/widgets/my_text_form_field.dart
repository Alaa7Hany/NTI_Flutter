import 'package:flutter/material.dart';
import '../wrapper/svg_wrapper.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.keyboardType,
    this.isPassword = false,
    required this.hint,
    required this.controller,
    this.onChangeVisibality,
    this.visibality,
    this.passController,
    this.isConfirmPass = false,
    this.noIcons = false,
    this.needValidation = true,
  });
  final TextInputType keyboardType;
  final bool isPassword;
  final String hint;
  final TextEditingController controller;
  final TextEditingController? passController;
  final void Function()? onChangeVisibality;
  final bool Function()? visibality;
  final bool isConfirmPass;
  final bool noIcons;
  final bool needValidation;

  String? validateUsername(String? value) {
    final usernameRegEx = RegExp(r'^[a-zA-Z0-9_]{3,16}$');
    if (value == null || value.isEmpty) {
      return 'Username is required';
    } else if (!usernameRegEx.hasMatch(value)) {
      return 'Username must be 3-16';
    }
    return null;
  }

  String? validatePassword(String? value) {
    final passwordRegEx = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (!passwordRegEx.hasMatch(value)) {
      return 'Password must be at least 8 characters, include letters and numbers';
    }
    return null;
  }

  String? validateConfirmPass(String? value) {
    print('Confirm: $value, Original: ${passController?.text}');
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (passController == null || passController!.text != value) {
      return 'Password not matched';
    }
    return null;
  }

  String? noValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
      validator:
          needValidation
              ? (isPassword
                  ? (isConfirmPass ? validateConfirmPass : validatePassword)
                  : validateUsername)
              : noValidation,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: visibality != null ? visibality!() : false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.grey,
          fontWeight: FontWeight.w200,
          fontSize: 14,
        ),
        prefixIcon:
            !noIcons
                ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child:
                        !isPassword
                            ? SvgWrappe(assetName: AppAssets.profile)
                            : SvgWrappe(assetName: AppAssets.password),
                  ),
                )
                : null,
        suffixIcon:
            isPassword
                ? IconButton(
                  onPressed: onChangeVisibality,
                  icon: SvgWrappe(
                    assetName:
                        (visibality != null ? visibality!() : false)
                            ? AppAssets.lock
                            : AppAssets.unlock,
                  ),
                )
                : null,
        enabledBorder: myInputBorder(AppColors.lightGrey),
        errorBorder: myInputBorder(Colors.red),
        focusedErrorBorder: myInputBorder(Colors.red),
        focusedBorder: myInputBorder(Colors.green),
        disabledBorder: myInputBorder(Colors.grey),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }

  InputBorder myInputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: borderColor, width: 2),
    );
  }
}
