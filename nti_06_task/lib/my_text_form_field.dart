import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nti_06_task/utils/app_assets.dart';

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
  });
  final TextInputType keyboardType;
  final bool isPassword;
  final String hint;
  final TextEditingController controller;
  final TextEditingController? passController;
  final void Function()? onChangeVisibality;
  final bool Function()? visibality;
  final bool isConfirmPass;

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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:
          isPassword
              ? (isConfirmPass ? validateConfirmPass : validatePassword)
              : validateUsername,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: visibality != null ? visibality!() : false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon:
            !isPassword
                ? SvgPicture.asset(AppAssets.profile)
                : Icon(Icons.key_outlined),
        suffixIcon:
            isPassword
                ? IconButton(
                  onPressed: onChangeVisibality,
                  icon: Icon(
                    (visibality != null ? visibality!() : false)
                        ? Icons.lock_outlined
                        : Icons.lock_open_outlined,
                  ),
                )
                : null,
        enabledBorder: myInputBorder(Colors.grey.shade300),
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
