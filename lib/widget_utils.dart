import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget addHeight(double? height) {
  return SizedBox(height: height);
}

Widget addWidth(double? width) {
  return SizedBox(width: width);
}

Widget textTitleLarge(BuildContext context, String text) {
  return Text(text, style: Theme.of(context).textTheme.titleLarge);
}

Widget textTitleLargeTablet(BuildContext context, String text) {
  return Text(text,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 13.sp));
}

Widget textTitleMedium(BuildContext context, String text) {
  return Text(text, style: Theme.of(context).textTheme.titleMedium);
}

Widget textTitleMediumTablet(BuildContext context, String text) {
  return Text(text,
      style:
          Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 10.sp));
}

Widget textTitleSmall(BuildContext context, String text) {
  return Text(text, style: Theme.of(context).textTheme.titleSmall);
}

Widget textLabelMedium(BuildContext context, String text) {
  return Text(text, style: Theme.of(context).textTheme.labelMedium);
}

Widget textLabelSmall(BuildContext context, String text) {
  return Text(text, style: Theme.of(context).textTheme.labelSmall);
}

Widget textBodyMedium(BuildContext context, String text) {
  return Text(text, style: Theme.of(context).textTheme.bodyMedium);
}

Widget textBodySmall(BuildContext context, String text) {
  return Text(text, style: Theme.of(context).textTheme.bodySmall);
}

Widget removePadding(BuildContext context, Widget child) {
  return MediaQuery.removePadding(
      removeTop: true, context: context, child: child);
}

void closeKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

extension WidgetUtil on Widget {
  Expanded get expand => Expanded(child: this);
}