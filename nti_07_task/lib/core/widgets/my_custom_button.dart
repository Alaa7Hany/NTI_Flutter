import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class MyCustomeButton extends StatelessWidget {
  const MyCustomeButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });
  final String text;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          elevation: 10,

          shadowColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        child:
            isLoading
                ? CircularProgressIndicator(color: Colors.white)
                : Text(
                  text,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                  ),
                ),
      ),
    );
  }
}
