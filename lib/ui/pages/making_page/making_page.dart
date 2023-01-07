import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:spacha_maker/controllers/pages/making_page_controller.dart';
import 'package:spacha_maker/models/models.dart';
import 'package:spacha_maker/routes.dart';
import 'package:spacha_maker/themes/app_colors.dart';
import 'package:spacha_maker/ui/dialogs/finish_saver_dialog.dart';
import 'package:spacha_maker/ui/pages/printing_page/printing_page.dart';
import 'package:spacha_maker/ui/widgets/keyboard_action_bar.dart';
import 'package:spacha_maker/ui/widgets/spasha_widget.dart';
import 'package:spacha_maker/utils/theme_text.dart';

class MakingPage extends StatelessWidget {
  MakingPage({super.key});

  final FocusNode nodeNameText = FocusNode();
  final FocusNode nodePriceText = FocusNode();
  final FocusNode nodeMessageText = FocusNode();

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
          final spacha = ref.watch(
            makingPageProvider.select((s) => s.spacha),
          );
          final iconImage = ref.watch(
            makingPageProvider.select((s) => s.iconImage),
          );
          final isCorner = ref.watch(
            makingPageProvider.select((s) => s.isCorner),
          );
          return Stack(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  //FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: KeyboardActions(
                  config: keyboardActionsConfig(
                    context: context,
                    focusNodeList: [
                      nodeNameText,
                      nodePriceText,
                      nodeMessageText,
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: ColoredBox(
                      color: background,
                      child: Column(
                        children: [
                          ColoredBox(
                            color: white,
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
                                      name: spacha?.name ?? '',
                                      price: spacha?.price ?? 200,
                                      message: spacha?.message ?? '',
                                      iconImage: iconImage,
                                      isCorner: isCorner,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          _buildIconArea(),
                          const Divider(),
                          _buildNameArea(),
                          const Divider(),
                          _buildPriceArea(),
                          const Divider(),
                          _buildMessageArea(),
                          const Divider(),
                          _buildCornerArea(),
                          const Divider(),
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
              ),
            ],
          );
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          final spacha = ref.watch(makingPageProvider.select((s) => s.spacha));
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                heroTag: 'printer',
                onPressed: () async {
                  await EasyLoading.show(
                    status: '画像を取り込み中',
                    maskType: EasyLoadingMaskType.black,
                  );
                  final boundary = spachaWidgetKey.currentContext!
                      .findRenderObject()! as RenderRepaintBoundary;
                  final spachaWidget =
                      await ref.read(makingPageProvider.notifier).exportToImage(
                            boundary: boundary,
                            pixelRatio: 5,
                            isSave: false,
                          );
                  final printingArguments = PrintingArguments(
                    height: spachaWidgetKey.currentContext!.size!.height,
                    width: spachaWidgetKey.currentContext!.size!.width,
                    spacha: spacha ?? const Spacha(),
                    spachaWidget: spachaWidget,
                  );
                  await EasyLoading.dismiss();
                  await Navigator.of(context).pushNamed(
                    RouteGenerator.printingPage,
                    arguments: printingArguments,
                  );
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
        return ExpansionTile(
          onExpansionChanged: (bool changed) {},
          title: const Subtitle1Text('アイコン', bottomPadding: 0),
          children: [
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
        return ExpansionTile(
          onExpansionChanged: (bool changed) async {
            if (changed) {
              Future.delayed(const Duration(milliseconds: 200), () {
                FocusScope.of(context).requestFocus(nodeNameText);
              });
            } else {
              FocusScope.of(context).unfocus();
            }
          },
          title: const Subtitle1Text('名前', bottomPadding: 0),
          children: [
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
                    focusNode: nodeNameText,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPriceArea() {
    return Consumer(
      builder: (context, ref, _) {
        return ExpansionTile(
          onExpansionChanged: (bool changed) {
            if (changed) {
              Future.delayed(const Duration(milliseconds: 200), () {
                FocusScope.of(context).requestFocus(nodePriceText);
              });
            } else {
              FocusScope.of(context).unfocus();
            }
          },
          title: const Subtitle1Text('金額', bottomPadding: 0),
          children: [
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
                    focusNode: nodePriceText,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMessageArea() {
    return Consumer(
      builder: (context, ref, _) {
        return ExpansionTile(
          onExpansionChanged: (bool changed) {
            if (changed) {
              Future.delayed(const Duration(milliseconds: 200), () {
                FocusScope.of(context).requestFocus(nodeMessageText);
              });
            } else {
              FocusScope.of(context).unfocus();
            }
          },
          title: const Subtitle1Text('メッセージ', bottomPadding: 0),
          children: [
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
                    focusNode: nodeMessageText,
                  ),
                ),
              ),
            ),
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
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Switch.adaptive(
                value: isCorner,
                activeColor: white,
                onChanged: (bool isBasket) {
                  ref.read(makingPageProvider.notifier).switchCorner();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
