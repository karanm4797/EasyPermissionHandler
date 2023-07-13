import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onClick;
  final double? height;
  final bool? showMargin;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;

  const CustomButton(
      {super.key,
      required this.onClick,
      required this.buttonText,
      this.showMargin,
      this.height,
      this.buttonColor,
        this.borderColor,
      this.textColor
      });

  @override
  Widget build(BuildContext context) {
    return _renderMobileButton(context);
  }

  Widget _renderMobileButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        height: height ?? 6.h,
        margin: showMargin ?? true
            ? EdgeInsets.symmetric(horizontal: 4.w)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
            border: Border.all(width: 0.3.w, color: borderColor ?? Colors.black),
            color: buttonColor ?? Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(2.5.w))),
        child: ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            Text(
              key: key,
              buttonText,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 11.sp,
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
