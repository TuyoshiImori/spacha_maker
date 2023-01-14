import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:keyboard_actions/external/platform_check/platform_check.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:spacha_maker/controllers/pages/making_page_controller.dart';
import 'package:spacha_maker/gen/assets.gen.dart';
import 'package:spacha_maker/models/models.dart';
import 'package:spacha_maker/routes.dart';
import 'package:spacha_maker/themes/app_colors.dart';
import 'package:spacha_maker/ui/dialogs/result_dialog.dart';
import 'package:spacha_maker/ui/pages/printing_page/printing_page.dart';
import 'package:spacha_maker/ui/widgets/keyboard_action_bar.dart';
import 'package:spacha_maker/ui/widgets/spacha_widget.dart';
import 'package:spacha_maker/ui/widgets/spasha_image_widget.dart';
import 'package:spacha_maker/utils/theme_text.dart';

class MakingPage extends StatelessWidget {
  MakingPage({super.key});

  final nodeNameText = FocusNode();
  final nodePriceText = FocusNode();
  final nodeMessageText = FocusNode();

  final spachaWidgetKey = GlobalKey();
  final spachaImageWidgetKey = GlobalKey();

  final nameFormKey = GlobalKey();
  final priceFormKey = GlobalKey();
  final messageFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
              Transform.translate(
                offset: Offset(
                  0,
                  -MediaQuery.of(context).size.height,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      RepaintBoundary(
                        key: spachaImageWidgetKey,
                        child: spachaImageWidget(
                          context: context,
                          name: spacha?.name ?? '',
                          price: spacha?.price ?? 200,
                          message: spacha?.message ?? '',
                          iconImage: iconImage,
                          isCorner: isCorner,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Column(
                        children: [
                          NotificationListener<SizeChangedLayoutNotification>(
                            onNotification: (notification) {
                              Future(() async {
                                final height = spachaWidgetKey
                                    .currentContext!.size!.height;
                                final limitHeight =
                                    (MediaQuery.of(context).size.width - 32) *
                                        (2 * sqrt(2) - 1) /
                                        3;
                                await ref
                                    .read(makingPageProvider.notifier)
                                    .comparisonHeight(
                                      height: height,
                                      limitHeight: limitHeight,
                                    );
                              });
                              return true;
                            },
                            child: SizeChangedLayoutNotifier(
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
                          const SizedBox(
                            height: 16,
                          ),
                          _buildCustomCard(
                            _buildEditArea(),
                          ),
                          const SizedBox(
                            height: 260,
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
          final spacha = ref.watch(
            makingPageProvider.select((s) => s.spacha),
          );
          final isSaving =
              ref.watch(makingPageProvider.select((s) => s.isSaving));
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () async {
                  final height = spachaWidgetKey.currentContext!.size!.height;
                  final limitHeight =
                      spachaImageWidgetKey.currentContext!.size!.height;

                  if (limitHeight < height) {
                    resultDialog(
                      message: '本文が長いのでPDFに変換できません',
                      context: context,
                      backCount: 0,
                    );
                  } else {
                    await EasyLoading.show(
                      status: '画像を取り込み中',
                      maskType: EasyLoadingMaskType.black,
                    );
                    final boundary = spachaImageWidgetKey.currentContext!
                        .findRenderObject()! as RenderRepaintBoundary;
                    final spachaWidget = await ref
                        .read(makingPageProvider.notifier)
                        .exportToImage(
                          boundary: boundary,
                          pixelRatio: 5,
                          isSave: false,
                        );
                    final printingArguments = PrintingArguments(
                      spacha: spacha ?? const Spacha(),
                      spachaWidget: spachaWidget,
                      isSaving: isSaving,
                    );
                    await EasyLoading.dismiss();
                    await Navigator.of(context).pushNamed(
                      RouteGenerator.printingPage,
                      arguments: printingArguments,
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
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Assets.images.pdfFile.image(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
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
                  resultDialog(
                    message: 'スパチャを保存しました',
                    context: context,
                    backCount: 0,
                  );
                },
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: spachaLightYellow,
                  ),
                  child: const Icon(
                    Icons.save_alt,
                    color: white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCustomCard(Widget card) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white,
      ),
      child: card,
    );
  }

  Widget _buildEditArea() {
    return Consumer(
      builder: (context, ref, _) {
        final isCorner = ref.watch(
          makingPageProvider.select((s) => s.isCorner),
        );
        final isSaving = ref.watch(
          makingPageProvider.select((s) => s.isSaving),
        );
        final isAblePdf = ref.watch(
          makingPageProvider.select((s) => s.isAblePdf),
        );
        final spacha = ref.watch(makingPageProvider.select((s) => s.spacha));

        final limitHeight =
            (MediaQuery.of(context).size.width - 32) * (2 * sqrt(2) - 1) / 3;
        ref.listen(makingPageProvider.select((s) => s.spachaWidgetHeight),
            (previous, next) {
          ref.read(makingPageProvider.notifier).comparisonHeight(
                height: next,
                limitHeight: limitHeight,
              );
        });
        return Column(
          children: [
            _buildTransitionListItem(
              caption: 'アイコンを編集する',
              onTap: () async {
                await ref.read(makingPageProvider.notifier).iconEdited();
              },
              item: const Icon(
                Icons.keyboard_arrow_right,
                size: 20,
                color: grey,
              ),
            ),
            const Divider(),
            _buildTransitionListItem(
              caption: '名前',
              item: _buildTextInput(
                context: context,
                onChanged: (name) {
                  ref.read(makingPageProvider.notifier).nameEdited(name: name);
                },
                onTap: () {
                  FocusScope.of(context).requestFocus(nodeNameText);
                },
                focusNode: nodeNameText,
                placeholder: '名前',
                formKey: nameFormKey,
                controller: TextEditingController(text: spacha?.name ?? ''),
              ),
            ),
            const Divider(),
            _buildTransitionListItem(
              caption: '金額',
              item: _buildTextInput(
                context: context,
                onChanged: (priceText) {
                  if (int.tryParse(priceText) != null) {
                    final price = int.parse(priceText);
                    ref
                        .read(makingPageProvider.notifier)
                        .priceEdited(price: price);
                  } else if (priceText == '') {
                    ref.read(makingPageProvider.notifier).priceEdited(price: 0);
                  }
                },
                onTap: () {
                  FocusScope.of(context).requestFocus(nodePriceText);
                },
                keyboardType: KeyboardType.numberPad,
                focusNode: nodePriceText,
                placeholder: '金額',
                formKey: priceFormKey,
                controller: TextEditingController(
                  text: spacha?.price.toString(),
                ),
              ),
            ),
            const Divider(),
            _buildTransitionListItem(
              caption: '本文',
              item: _buildTextInput(
                context: context,
                onChanged: (message) {
                  ref.read(makingPageProvider.notifier).messageEdited(
                        message: message,
                      );
                },
                onTap: () {
                  FocusScope.of(context).requestFocus(nodeMessageText);
                },
                focusNode: nodeMessageText,
                placeholder: 'メッセージ',
                formKey: messageFormKey,
                controller: TextEditingController(text: spacha?.message ?? ''),
              ),
            ),
            if (!isAblePdf) const Divider(),
            if (!isAblePdf)
              _buildTransitionListItem(
                caption: '＊本文が長いのでPDF変換ができません',
                textColor: error,
                item: Container(),
              ),
            const Divider(),
            _buildTransitionListItem(
              caption: '角の丸み',
              item: _buildSwitch(
                value: isCorner,
                onChanged: (value) {
                  ref.read(makingPageProvider.notifier).switchCorner();
                },
              ),
            ),
            const Divider(),
            _buildTransitionListItem(
              caption: 'インクの節約',
              item: _buildSwitch(
                value: isSaving,
                onChanged: (value) {
                  ref.read(makingPageProvider.notifier).switchSaving();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextInput({
    required BuildContext context,
    required void Function(String) onChanged,
    required FocusNode focusNode,
    KeyboardType? keyboardType,
    required String placeholder,
    required void Function() onTap,
    required GlobalKey formKey,
    required TextEditingController controller,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (3 / 5),
      height: 56,
      child: Center(
        child: NativeTextInput(
          controller: controller,
          key: formKey,
          style: const TextStyle(
            fontSize: 16,
            color: black,
          ),
          //minHeightPadding: 4,
          //textCapitalization: TextCapitalization.sentences,
          placeholder: placeholder,
          placeholderColor: black.withOpacity(0.5),
          keyboardType: keyboardType ?? KeyboardType.defaultType,
          iosOptions: IosOptions(
            autocorrect: true,
            cursorColor: cursorColor,
            keyboardAppearance: Brightness.dark,
          ),
          onChanged: (name) async {
            onChanged(name);
          },
          onTap: () {
            onTap();
          },
          focusNode: PlatformCheck.isIOS ? focusNode : null,
        ),
      ),
    );
  }

  Widget _buildTransitionListItem({
    required String caption,
    void Function()? onTap,
    required Widget item,
    Color? textColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 46,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyText1Text(
              caption,
              color: textColor ?? black,
            ),
            item,
          ],
        ),
      ),
    );
  }

  Widget _buildSwitch({
    required bool value,
    required void Function(bool) onChanged,
  }) {
    return PlatformCheck.isAndroid
        ? Switch(
            value: value,
            activeColor: spachaLightYellow,
            onChanged: (bool value) {
              onChanged(value);
            },
          )
        : Switch.adaptive(
            value: value,
            activeColor: spachaLightYellow,
            onChanged: (bool value) {
              onChanged(value);
            },
          );
  }
}
