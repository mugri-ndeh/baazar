import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../theme/app_colors.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.onChanged,
    required this.hintText,
    required this.labelText,
    this.initialValue,

    this.enabled = true,
    this.isPassword = false,
  });
  final Function(String) onChanged;
  final String hintText;
  final String labelText;
  final String? initialValue;

  final bool enabled;
  final bool isPassword;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool obscureText = false;
  @override
  void initState() {
    obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6.h,
      crossAxisAlignment: .start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(fontFamily: FontFamily.roboto),
        ),
        Container(
          padding: .symmetric(vertical: 12.h, horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: .circular(8.r),
            color: AppColors.gray50,
          ),
          child: TextFormField(
            initialValue: widget.initialValue,
            onChanged: widget.onChanged,
            obscureText: obscureText,
            enabled: widget.enabled,
            decoration: InputDecoration(
              suffixIcon: widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: obscureText
                            ? Assets.icons.passwordOutline.svg()
                            : Assets.icons.passwordHide.svg(
                                colorFilter: ColorFilter.mode(
                                  AppColors.gray500,
                                  BlendMode.srcIn,
                                ),
                              ),
                      ),
                    )
                  : null,
              border: InputBorder.none,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontFamily: FontFamily.roboto,
                color: AppColors.gray400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
