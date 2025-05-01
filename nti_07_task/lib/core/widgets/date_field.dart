import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nti_06_task/core/utils/app_assets.dart';
import 'package:nti_06_task/core/utils/app_colors.dart';
import 'package:nti_06_task/core/utils/app_text_styles.dart';
import 'package:nti_06_task/core/wrapper/svg_wrapper.dart';

class DateField extends StatelessWidget {
  const DateField({super.key, this.dateTime});
  final DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.lightGrey, width: 1),
      ),
      child: TextField(
        readOnly: true,
        onTap: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2025),
            lastDate: DateTime(2026),
            builder: (context, child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: AppColors.primaryColor,
                  colorScheme: ColorScheme.light(
                    primary: AppColors.primaryColor,
                  ),
                  buttonTheme: const ButtonThemeData(
                    textTheme: ButtonTextTheme.primary,
                  ),
                ),
                child: child!,
              );
            },
          );
        },
        canRequestFocus: false,

        decoration: InputDecoration(
          label: Text(
            DateFormat(
              'd MMMM, y\t h:mm a',
            ).format(dateTime ?? DateTime.now()).toString(),
            style: AppTextStyles.s14w300.copyWith(color: AppColors.black),
            textAlign: TextAlign.center,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgWrappe(assetName: AppAssets.calender),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
