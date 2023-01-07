import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:spacha_maker/themes/app_colors.dart';
import 'package:spacha_maker/utils/theme_text.dart';

KeyboardActionsConfig keyboardActionsConfig({
  required BuildContext context,
  required List<FocusNode> focusNodeList,
}) {
  return KeyboardActionsConfig(
    keyboardBarColor: keyboardBarColor,
    //keyboardSeparatorColor: keyboardSeparatorColor,
    nextFocus: false,
    //デフォルトはtrueで左側にフォームを上下するボタンが表示される

    actions: [
      for (final focusNode in focusNodeList)
        keyboardActionsItem(context: context, focusNode: focusNode),
    ],
  );
}

KeyboardActionsItem keyboardActionsItem({
  required BuildContext context,
  required FocusNode focusNode,
}) {
  return KeyboardActionsItem(
    focusNode: focusNode,
    toolbarButtons: [
      (node) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 16, top: 8, bottom: 8),
            child: Subtitle1Text(
              '完了',
              color: selectable,
            ),
          ),
        );
      },
    ],
  );
}
