import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/extension/string_extension.dart';
import '../../core/init/lang/locale_keys.g.dart';

mixin DeleteItemDialog {
  static Future<String?> deleteItemDialog(BuildContext context, {required String title, required void Function()? onPressed}) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        content: Text(LocaleKeys.CustomTexts_questionDelete.locale),
        actions: <Widget>[
          TextButton(
            onPressed: () => context.router.pop(),
            child: Text(LocaleKeys.CustomTexts_cancelDelete.locale),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(LocaleKeys.CustomTexts_okDelete.locale),
          ),
        ],
      ),
    );
  }
}
