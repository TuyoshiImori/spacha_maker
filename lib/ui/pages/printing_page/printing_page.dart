import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:spacha_maker/controllers/pages/printing_page_controller.dart';
import 'package:spacha_maker/models/models.dart';
import 'package:spacha_maker/ui/widgets/spacha_envelope.dart';
import 'package:spacha_maker/utils/theme_text.dart';

class PrintingArguments {
  PrintingArguments({
    required this.height,
    required this.width,
    required this.spacha,
    required this.spachaWidget,
  });

  final double height;
  final double width;
  final Spacha spacha;
  final Uint8List spachaWidget;
}

class PrintingPage extends StatelessWidget {
  const PrintingPage({required this.printingArguments, super.key});

  final PrintingArguments printingArguments;

  @override
  Widget build(BuildContext context) {
    final spachaEnvelopeKey = GlobalKey();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: AppBar(
          elevation: 0,
          title: const Subtitle1Text('印刷'),
        ),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          return Stack(
            children: [
              PdfPreview(
                allowPrinting: false,
                allowSharing: false,
                canChangePageFormat: false,
                canDebug: false,
                build: (format) {
                  return generatePdf(ref);
                },
              ),
              RepaintBoundary(
                key: spachaEnvelopeKey,
                child: spachaEnvelope(
                  context: context,
                  price: printingArguments.spacha.price,
                  //spachaWidget: spachaWidget,
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          final uint8List =
              ref.watch(printingPageProvider.select((s) => s.uint8list));
          return FloatingActionButton(
            onPressed: () async {
              if (uint8List != null) {
                await Printing.layoutPdf(
                  onLayout: (_) => uint8List,
                );
              }
            },
            child: const Icon(Icons.print),
          );
        },
      ),
    );
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
                decoration: pw.BoxDecoration(
                  image: pw.DecorationImage(
                    image: pw.MemoryImage(printingArguments.spachaWidget),
                    //fit: pw.BoxFit.fill,
                  ),
                ),
              ),
            );
          },
        ),
      );
    final uint8List = await pdf.save();
    ref.read(printingPageProvider.notifier).setUint8List(uint8List);
    return pdf.save();
  }
}
