import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spacha_maker/controllers/pages/making_page_controller.dart';
import 'package:spacha_maker/routes.dart';
import 'package:spacha_maker/themes/app_colors.dart';
import 'package:spacha_maker/ui/dialogs/finish_saver_dialog.dart';
import 'package:spacha_maker/ui/pages/printing_page/printing_page.dart';
import 'package:spacha_maker/ui/widgets/spacha_envelope.dart';
import 'package:spacha_maker/ui/widgets/spasha_widget.dart';
import 'package:spacha_maker/utils/theme_text.dart';

class MakingPage extends StatelessWidget {
  const MakingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final spachaWidgetKey = GlobalKey();
    final spachaEnvelopeKey = GlobalKey();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: AppBar(
          elevation: 0,
          title: const Subtitle1Text('スパチャメーカー'),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(RouteGenerator.otherPage);
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  8,
                  16,
                  8,
                ),
                child: Icon(Icons.menu),
              ),
            ),
          ],
        ),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final name = ref.watch(
                makingPageProvider.select((s) => s.spacha?.name),
              ) ??
              ' ';
          final price = ref.watch(
                makingPageProvider.select((s) => s.spacha?.price),
              ) ??
              0;
          final message = ref.watch(
                makingPageProvider.select((s) => s.spacha?.message),
              ) ??
              ' ';
          final iconImage = ref.watch(
            makingPageProvider.select((s) => s.iconImage),
          );
          final isCorner = ref.watch(
            makingPageProvider.select((s) => s.isCorner),
          );
          return Stack(
            children: [
              Transform.translate(
                offset: Offset(
                  0,
                  -MediaQuery.of(context).size.height,
                ),
                child: RepaintBoundary(
                  key: spachaEnvelopeKey,
                  child: spachaEnvelope(
                    context: context,
                    name: name,
                    price: price,
                    message: message,
                    iconImage: iconImage,
                    isCorner: isCorner,
                  ),
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  child: ColoredBox(
                    color: background,
                    child: Column(
                      children: [
                        Container(
                          color: white,
                          height: 300,
                          child: SingleChildScrollView(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 20,
                                ),
                                child: RepaintBoundary(
                                  key: spachaWidgetKey,
                                  child: spachaWidget(
                                    context: context,
                                    name: name,
                                    price: price,
                                    message: message,
                                    iconImage: iconImage,
                                    isCorner: isCorner,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        _buildIconArea(),
                        _buildNameArea(),
                        _buildPriceArea(),
                        _buildMessageArea(),
                        _buildCornerArea(),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 320,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                heroTag: 'printer',
                onPressed: () async {
                  final mediaHeight = (MediaQuery.of(context).size.width - 32) *
                      ((2 * sqrt(2) - 1) / 3);
                  final widgetHeight =
                      spachaWidgetKey.currentContext!.size!.height;
                  print(mediaHeight);
                  print(widgetHeight);
                  if (mediaHeight > widgetHeight) {
                    await EasyLoading.show(
                      status: '画像を取り込み中',
                      maskType: EasyLoadingMaskType.black,
                    );
                    final boundary = spachaWidgetKey.currentContext!
                        .findRenderObject()! as RenderRepaintBoundary;
                    final spachaWidget = await ref
                        .read(makingPageProvider.notifier)
                        .exportToImage(
                          boundary: boundary,
                          pixelRatio: 5,
                          isSave: false,
                        );
                    final printingArguments = PrintingArguments(
                      height: spachaWidgetKey.currentContext!.size!.height,
                      width: spachaWidgetKey.currentContext!.size!.width,
                      spachaWidget: spachaWidget,
                    );
                    await EasyLoading.dismiss();
                    await Navigator.of(context).pushNamed(
                      RouteGenerator.printingPage,
                      arguments: printingArguments,
                    );
                  } else {
                    finishSaverDialog(
                      message: 'メッセージの文字数を\n減らしてください',
                      context: context,
                      backCount: 0,
                    );
                  }
                },
                child: const Icon(Icons.chevron_right),
              ),
              const SizedBox(
                height: 16,
              ),
              FloatingActionButton(
                heroTag: 'saver',
                onPressed: () {
                  EasyLoading.show(
                    status: '画像を取り込み中',
                    maskType: EasyLoadingMaskType.black,
                  );
                  final boundary = spachaWidgetKey.currentContext!
                      .findRenderObject()! as RenderRepaintBoundary;
                  ref.read(makingPageProvider.notifier).exportToImage(
                        boundary: boundary,
                        pixelRatio: 5,
                        isSave: true,
                      );
                  EasyLoading.dismiss();
                  finishSaverDialog(
                    context: context,
                    backCount: 0,
                  );
                },
                child: const Icon(Icons.add),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildIconArea() {
    return Consumer(
      builder: (context, ref, _) {
        final iconImage =
            ref.watch(makingPageProvider.select((s) => s.iconImage));
        return Column(
          children: [
            SizedBox(
              height: 46,
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 16, bottom: 6),
                child: const Subtitle1Text('アイコン', bottomPadding: 0),
              ),
            ),
            if (iconImage != null)
              CircleAvatar(
                radius: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipOval(
                      child: Image.file(
                        iconImage,
                        width: 110,
                        height: 110,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          await ref
                              .read(makingPageProvider.notifier)
                              .iconEdited();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(30),
                          child: const Icon(
                            Icons.camera_enhance_outlined,
                            size: 40,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (iconImage == null)
              Stack(
                alignment: Alignment.center,
                children: [
                  const Center(
                    child: Icon(
                      Icons.account_circle_sharp,
                      color: black,
                      size: 120,
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () async {
                        await ref
                            .read(makingPageProvider.notifier)
                            .iconEdited();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        child: const Icon(
                          Icons.camera_enhance_outlined,
                          size: 40,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        );
      },
    );
  }

  Widget _buildNameArea() {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          children: [
            SizedBox(
              height: 46,
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 16, bottom: 6),
                child: const Subtitle1Text('名前', bottomPadding: 0),
              ),
            ),
            const Divider(),
            SizedBox(
              height: 56,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Center(
                  child: NativeTextInput(
                    style: const TextStyle(
                      fontSize: 16,
                      color: black,
                    ),
                    minHeightPadding: 4,
                    textCapitalization: TextCapitalization.sentences,
                    placeholder: '名前',
                    placeholderColor: black.withOpacity(0.5),
                    iosOptions: IosOptions(
                      autocorrect: true,
                      cursorColor: cursorColor,
                      keyboardAppearance: Brightness.dark,
                    ),
                    onChanged: (name) async {
                      ref
                          .read(makingPageProvider.notifier)
                          .nameEdited(name: name);
                    },
                    //onSubmitted: _onSubmittedText,
                    //focusNode: _focusNode,
                  ),
                ),
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }

  Widget _buildPriceArea() {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          children: [
            SizedBox(
              height: 46,
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 16, bottom: 6),
                child: const Subtitle1Text('金額', bottomPadding: 0),
              ),
            ),
            const Divider(),
            SizedBox(
              height: 56,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Center(
                  child: NativeTextInput(
                    style: const TextStyle(
                      fontSize: 16,
                      color: black,
                    ),
                    minHeightPadding: 4,
                    textCapitalization: TextCapitalization.sentences,
                    placeholder: '金額',
                    placeholderColor: black.withOpacity(0.5),
                    iosOptions: IosOptions(
                      autocorrect: true,
                      cursorColor: cursorColor,
                      keyboardAppearance: Brightness.dark,
                    ),
                    keyboardType: KeyboardType.numberPad,
                    onChanged: (priceText) async {
                      if (int.tryParse(priceText) != null) {
                        final price = int.parse(priceText);
                        ref
                            .read(makingPageProvider.notifier)
                            .priceEdited(price: price);
                      } else if (priceText == '') {
                        ref
                            .read(makingPageProvider.notifier)
                            .priceEdited(price: 0);
                      }
                    },
                    //onSubmitted: _onSubmittedText,
                    //focusNode: _focusNode,
                  ),
                ),
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }

  Widget _buildMessageArea() {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          children: [
            SizedBox(
              height: 46,
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 16, bottom: 6),
                child: const Subtitle1Text('メッセージ', bottomPadding: 0),
              ),
            ),
            const Divider(),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 56,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Center(
                  child: NativeTextInput(
                    style: const TextStyle(
                      fontSize: 16,
                      color: black,
                    ),
                    maxLines: 10,
                    minHeightPadding: 4,
                    textCapitalization: TextCapitalization.sentences,
                    placeholder: 'メッセージ',
                    placeholderColor: black.withOpacity(0.5),
                    iosOptions: IosOptions(
                      autocorrect: true,
                      cursorColor: cursorColor,
                      keyboardAppearance: Brightness.dark,
                    ),
                    onChanged: (message) {
                      ref
                          .read(makingPageProvider.notifier)
                          .messageEdited(message: message);
                    },
                    //onSubmitted: _onSubmittedText,
                    //focusNode: _focusNode,
                  ),
                ),
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }

  Widget _buildCornerArea() {
    return Consumer(
      builder: (context, ref, _) {
        final isCorner = ref.watch(
          makingPageProvider.select((s) => s.isCorner),
        );
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 56,
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Subtitle1Text('角の丸み', bottomPadding: 0),
                  ),
                ],
              ),
            ),
            Switch.adaptive(
              value: isCorner,
              activeColor: white,
              onChanged: (bool isBasket) {
                ref.read(makingPageProvider.notifier).switchCorner();
              },
            ),
          ],
        );
      },
    );
  }
}
