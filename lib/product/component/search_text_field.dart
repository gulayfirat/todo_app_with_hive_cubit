import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../extension/context_extension.dart';
import '../navigator/app_router.dart';
import '../widget/custom_text_field.dart';

class SearchTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final String? hintText;

  const SearchTextField({
    super.key,
    required this.onChanged,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.normalPadding,
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
              controller: controller,
              hintText: hintText,
              inputAction: TextInputAction.search,
              onChanged: onChanged,
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          IconButton(onPressed: () => context.router.navigate(const SettingsRoute()), icon: const Icon(Icons.settings))
        ],
      ),
    );
  }
}
