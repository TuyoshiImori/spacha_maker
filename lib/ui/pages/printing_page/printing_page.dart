import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:spacha_maker/controllers/pages/printing_page_controller.dart';
import 'package:spacha_maker/models/models.dart';
import 'package:spacha_maker/themes/app_colors.dart';
import 'package:spacha_maker/ui/widgets/spacha_envelope.dart';
import 'package:spacha_maker/utils/theme_text.dart';

class PrintingArguments {
  PrintingArguments({
    required this.spacha,
    required this.spachaWidget,
    required this.isSaving,
  });

  final Spacha spacha;
  final Uint8List spachaWidget;
  final bool isSaving;
}

class PrintingPage extends StatelessWidget {
  const PrintingPage({required this.printingArguments, super.key});

  final PrintingArguments printingArguments;

  @override
  Widget build(BuildContext context) {
    final envelopeKey = GlobalKey();
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
          return Stack(
            children: [
              RepaintBoundary(
                key: envelopeKey,
                child: spachaEnvelope(
                  context: context,
                  price: printingArguments.spacha.price,
                  spachaWidget: printingArguments.spachaWidget,
                  isSaving: printingArguments.isSaving,
                ),
              ),
              PdfPreview(
                allowPrinting: false,
                allowSharing: false,
                canChangePageFormat: false,
                canDebug: false,
                build: (format) {
                  return generatePdf(
                    ref: ref,
                    context: context,
                    key: envelopeKey,
                  );
                },
              ),
            ],
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
    required GlobalKey key,
  }) async {
    final boundary =
        key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    final spacha = await ref.read(printingPageProvider.notifier).exportToImage(
          boundary: boundary,
          pixelRatio: 5,
        );

    final pdf = pw.Document()..addPage(page(uint8list: spacha));
    final uint8List = await pdf.save();
    ref.read(printingPageProvider.notifier).setUint8List(uint8List);
    return pdf.save();
  }

  pw.Page page({required Uint8List uint8list}) {
    return pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.FullPage(
          ignoreMargins: true,
          child: pw.Container(
            decoration: pw.BoxDecoration(
              image: pw.DecorationImage(
                image: pw.MemoryImage(uint8list),
                fit: pw.BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
