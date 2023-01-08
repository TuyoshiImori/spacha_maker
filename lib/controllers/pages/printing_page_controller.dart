import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

part 'printing_page_controller.freezed.dart';

@freezed
class PrintingPageState with _$PrintingPageState {
  const factory PrintingPageState({
    Uint8List? uint8list,
    @Default(false) bool isSaving,
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

  Future<Uint8List> exportToImage({
    required RenderRepaintBoundary boundary,
    required double pixelRatio,
  }) async {
    final img = await boundary.toImage(pixelRatio: pixelRatio);
    final byteData = await img.toByteData(
      format: ui.ImageByteFormat.png,
    );
    final pngBytes = byteData!.buffer.asUint8List();
    return pngBytes;
  }

  void setUint8List(Uint8List uint8list) {
    state = state.copyWith(uint8list: uint8list);
  }

  Future<Uint8List> generatePdf(WidgetRef ref) async {
    final pdf = pw.Document()
      ..addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.FullPage(
              ignoreMargins: true,
              child: pw.Container(
                  // height: printingArguments.height * 0.5,
                  // width: printingArguments.width * 0.5,
                  ),
            );
          },
        ),
      );
    return pdf.save();
  }
}
