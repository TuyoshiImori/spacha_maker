import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_controller.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool haveSeenIntro,
  }) = _AppState;
}

final appProvider =
    StateNotifierProvider.autoDispose<AppController, AppState>((ref) {
  return AppController();
});

class AppController extends StateNotifier<AppState> {
  AppController() : super(const AppState()) {
    _init();
  }

  Future<void> _init() async {}

  Future<bool> haveSeenIntro() async {
    final prefs = await SharedPreferences.getInstance();
    final haveSeenIntro = prefs.getBool('haveSeenIntro') ?? false;
    state = state.copyWith(haveSeenIntro: haveSeenIntro);
    return haveSeenIntro;
  }
}
