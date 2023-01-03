import 'dart:async';
import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'printing_page_controller.freezed.dart';

@freezed
class PrintingPageState with _$PrintingPageState {
  const factory PrintingPageState({
    Uint8List? uint8list,
  }) = _PrintingPageState;
}

final printingPageProvider = StateNotifierProvider.autoDispose<
    PrintingPageController, PrintingPageState>((ref) {
  return PrintingPageController();
});

class PrintingPageController extends StateNotifier<PrintingPageState> {
  PrintingPageController() : super(const PrintingPageState()) {
    _init();
  }

  Future<void> _init() async {}

  void setUint8List(Uint8List uint8list) {
    state = state.copyWith(uint8list: uint8list);
  }
}
