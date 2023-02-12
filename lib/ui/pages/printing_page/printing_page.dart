import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:spacha_maker/controllers/pages/printing_page_controller.dart';
import 'package:spacha_maker/models/models.dart';
import 'package:spacha_maker/themes/app_colors.dart';
import 'package:spacha_maker/utils/theme_text.dart';

class PrintingArguments {
  PrintingArguments({
    required this.spacha,
    required this.spachaImage,
    required this.isSaving,
  });

  final Spacha spacha;
  final Uint8List spachaImage;
  final bool isSaving;
}

class PrintingPage extends StatelessWidget {
  const PrintingPage({required this.printingArguments, super.key});

  final PrintingArguments printingArguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: AppBar(
          elevation: 0,
          title: const Subtitle1Text('PDFプレビュー'),
        ),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          return PdfPreview(
            allowPrinting: false,
            allowSharing: false,
            canChangePageFormat: false,
            canDebug: false,
            build: (format) {
              return generatePdf(
                ref: ref,
                context: context,
                printingArguments: printingArguments,
              );
            },
          );
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          final uint8List =
              ref.watch(printingPageProvider.select((s) => s.uint8list));
          return GestureDetector(
            onTap: () async {
              if (uint8List != null) {
                await Printing.layoutPdf(
                  onLayout: (_) => uint8List,
                );
              }
            },
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: spachaLightYellow,
                  ),
                ),
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(
                    Icons.print,
                    color: white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<Uint8List> generatePdf({
    required WidgetRef ref,
    required BuildContext context,
    required PrintingArguments printingArguments,
  }) async {
    final pdf = pw.Document()
      ..addPage(
        page(
          uint8list: printingArguments.spachaImage,
          context: context,
          isSaving: printingArguments.isSaving,
          price: printingArguments.spacha.price,
        ),
      );
    final uint8List = await pdf.save();
    ref.read(printingPageProvider.notifier).setUint8List(uint8List);
    return pdf.save();
  }

  static pw.Widget buildBottomUpperLeftLine() {
    final paint = pw.CustomPaint(
      painter: (PdfGraphics canvas, PdfPoint size) {
        canvas.drawLine(size.x, size.y, 0, size.y - size.x);
      },
    );
    return paint;
  }

  static pw.Widget buildBottomUpperRightLine() {
    final paint = pw.CustomPaint(
      painter: (PdfGraphics canvas, PdfPoint size) {
        canvas.drawLine(size.x, 0, 0, size.x);
      },
    );
    return paint;
  }

  static pw.Widget buildUpperLeftLine() {
    final paint = pw.CustomPaint(
      painter: (PdfGraphics canvas, PdfPoint size) {
        canvas.drawLine(size.x, 0, 0, size.y);
      },
    );
    return paint;
  }

  static pw.Widget buildUpperRightLine() {
    final paint = pw.CustomPaint(
      painter: (PdfGraphics canvas, PdfPoint size) {
        canvas.drawLine(0, 0, size.x, size.y);
      },
    );
    return paint;
  }

  pw.Page page({
    required BuildContext context,
    required Uint8List uint8list,
    required bool isSaving,
    required int price,
  }) {
    PdfColor widgetLightColor() {
      if (isSaving) {
        return pdfWhite;
      }
      if (200 <= price && price <= 499) {
        return pdfSpachaLightCyan;
      } else if (500 <= price && price <= 999) {
        return pdfSpachaLightGreen;
      } else if (1000 <= price && price <= 1999) {
        return pdfSpachaLightYellow;
      } else if (2000 <= price && price <= 4999) {
        return pdfSpachaLightOrange;
      } else if (5000 <= price && price <= 9999) {
        return pdfSpachaLightMagenta;
      } else if (10000 <= price) {
        return pdfSpachaLightRed;
      }
      return pdfSpachaBlue;
    }

    return pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        final height = context.page.pageFormat.height;
        final width = context.page.pageFormat.width;
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Container(
            decoration: pw.BoxDecoration(
              color: widgetLightColor(),
            ),
            child: pw.Row(
              children: [
                pw.Column(
                  children: [
                    pw.Container(
                      width: width / 12 * (4 - sqrt(2)),
                      height: (height / 4) - 0.5,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          right: pw.BorderSide(width: 0.7),
                        ),
                      ),
                      child: buildBottomUpperLeftLine(),
                    ),
                    pw.Container(
                      width: width / 12 * (4 - sqrt(2)),
                      height: (height / 4) - 0.5,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          top: pw.BorderSide(width: 0.7),
                          bottom: pw.BorderSide(width: 0.7),
                          right: pw.BorderSide(width: 0.7),
                        ),
                      ),
                      child: buildBottomUpperRightLine(),
                    ),
                    pw.Container(
                      width: width / 12 * (4 - sqrt(2)),
                      height: (height / 4) - 0.5,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          bottom: pw.BorderSide(width: 0.7),
                          right: pw.BorderSide(width: 0.7),
                        ),
                      ),
                      child: buildBottomUpperLeftLine(),
                    ),
                    pw.Container(
                      width: width / 12 * (4 - sqrt(2)),
                      height: (height / 4) - 0.5,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          right: pw.BorderSide(width: 0.7),
                        ),
                      ),
                      child: buildBottomUpperRightLine(),
                    ),
                  ],
                ),
                pw.Column(
                  children: [
                    pw.Container(
                      width: width / 6 * (4 - sqrt(2)) - 2,
                      height: height / 4,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          bottom: pw.BorderSide(width: 0.7),
                        ),
                      ),
                    ),
                    pw.Container(
                      width: width / 6 * (4 - sqrt(2)) - 2,
                      height: (height / 2) - 2,
                      decoration: pw.BoxDecoration(
                        image: pw.DecorationImage(
                          image: pw.MemoryImage(uint8list),
                          fit: pw.BoxFit.fill,
                        ),
                      ),
                    ),
                    pw.Container(
                      width: width / 6 * (4 - sqrt(2)) - 2,
                      height: height / 4,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          top: pw.BorderSide(width: 0.7),
                        ),
                      ),
                    ),
                  ],
                ),
                pw.Column(
                  children: [
                    pw.Container(
                      width: width * (sqrt(2) / 4),
                      height: (height / 4) - 0.5,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          left: pw.BorderSide(width: 0.7),
                        ),
                      ),
                      child: buildUpperLeftLine(),
                    ),
                    pw.Container(
                      width: width * (sqrt(2) / 4),
                      height: (height / 4) - 0.5,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          top: pw.BorderSide(width: 0.7),
                          bottom: pw.BorderSide(width: 0.7),
                        ),
                      ),
                      child: buildUpperRightLine(),
                    ),
                    pw.Container(
                      width: width * (sqrt(2) / 4),
                      height: (height / 4) - 0.5,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          bottom: pw.BorderSide(width: 0.7),
                        ),
                      ),
                      child: buildUpperLeftLine(),
                    ),
                    pw.Container(
                      width: width * (sqrt(2) / 4),
                      height: (height / 4) - 0.5,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          left: pw.BorderSide(width: 0.7),
                        ),
                      ),
                      child: buildUpperRightLine(),
                    ),
                  ],
                ),

                /// これがないとなぜか右下のcustompaintが表示されない
                pw.Column(
                  children: [
                    pw.Container(
                      width: 1,
                      height: 1,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          bottom: pw.BorderSide(width: 0.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
