import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';

part 'other_page_controller.freezed.dart';

@freezed
class OtherPageState with _$OtherPageState {
  const factory OtherPageState({
    @Default(false) bool isAvailable,
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
}
