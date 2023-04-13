import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/enum/theme/app_themes.dart';
import '../../core/init/notifier/theme_notifier.dart';
import '../constant/size_constant.dart';
import '../extension/context_extension.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextInputAction inputAction;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isNote;

  const CustomTextField({
    Key? key,
    this.hintText,
    required this.inputAction,
    required this.controller,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.isNote = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: inputAction == TextInputAction.newline ? null : context.searchTextHeight,
      child: TextField(
        onChanged: onChanged,
        textInputAction: inputAction,
        controller: controller,
        maxLines: inputAction == TextInputAction.newline ? 34 : 1,
        style: _getTextStyle(context),
        minLines: 1,
        decoration: InputDecoration(
          hintText: hintText ?? "",
          hintStyle: _getHintTextStyle(context),
          contentPadding: context.zeroPadding,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder: inputAction == TextInputAction.newline
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(width: SizeConstant.instance.textFNotFocusWidth, color: Theme.of(context).colorScheme.onSurface),
                  borderRadius: context.border20Radius,
                ),
          focusedBorder: inputAction == TextInputAction.newline
              ? InputBorder.none
              : OutlineInputBorder(
                  borderSide: BorderSide(
                    width: SizeConstant.instance.textFFocusedWidth,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  borderRadius: context.border20Radius,
                ),
        ),
      ),
    );
  }

  TextStyle? _getTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(
        color: isNote == true && Provider.of<ThemeNotifier>(context).currentThemeEnum == AppThemes.dark
            ? Theme.of(context).colorScheme.onSecondary
            : null);
  }

  TextStyle? _getHintTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface);
  }
}
