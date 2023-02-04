import 'dart:async';

import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';

part 'other_page_controller.freezed.dart';

@freezed
class OtherPageState with _$OtherPageState {
  const factory OtherPageState({
    @Default(false)
        bool isAvailable,
    @Default(0)
        int iconIndex,
    @Default(<String>[
      'app_blue_icon',
      'app_cyan_icon',
      'app_green_icon',
      'app_yellow_icon',
      'app_orange_icon',
      'app_magenta_icon',
      'app_red_icon',
    ])
        List<String> iconName,
  }) = _OtherPageState;
}

final otherPageProvider =
    StateNotifierProvider.autoDispose<OtherPageController, OtherPageState>(
        (ref) {
  return OtherPageController();
});

class OtherPageController extends StateNotifier<OtherPageState> {
  OtherPageController() : super(const OtherPageState()) {
    _init();
  }

  final inAppReview = InAppReview.instance;

  Future<void> _init() async {
    final isAvailable = await inAppReview.isAvailable();
    state = state.copyWith(
      isAvailable: isAvailable,
    );
  }

  Future<void> requestReview() async {
    await inAppReview.requestReview();
  }

  Future<void> changeAppIcon({required int iconIndex}) async {
    final iconName = state.iconName[iconIndex];
    print(iconName);

    if (await FlutterDynamicIcon.supportsAlternateIcons) {
      await FlutterDynamicIcon.setAlternateIconName(iconName);
      state = state.copyWith(iconIndex: iconIndex);
      //return;
    }
  }
}
