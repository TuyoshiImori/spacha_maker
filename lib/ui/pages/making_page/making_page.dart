import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_native_text_input/flutter_native_text_input.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spacha_maker/controllers/pages/making_page_controller.dart';
import 'package:spacha_maker/routes.dart';
import 'package:spacha_maker/themes/app_colors.dart';
import 'package:spacha_maker/ui/dialogs/finish_saver_dialog.dart';
import 'package:spacha_maker/ui/widgets/spasha_widget.dart';
import 'package:spacha_maker/utils/theme_text.dart';

class MakingPage extends StatelessWidget {
  const MakingPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final bottomSpace = MediaQuery.of(context).viewInsets.bottom;
    final globalKey = GlobalKey();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: AppBar(
          elevation: 0,
          title: const Subtitle1Text('スパチャメーカー'),
          backgroundColor: spachaYellow,
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
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    child: RepaintBoundary(
                      key: globalKey,
                      child: spachaWidget(
                        context: context,
                        name: name,
                        price: price,
                        message: message,
                        iconImage: iconImage,
                      ),
                    ),
                  ),
                  _buildIconArea(),
                  _buildNameArea(),
                  _buildPriceArea(),
                  _buildMessageArea(),
                  const SizedBox(
                    height: 320,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          return FloatingActionButton(
            onPressed: () {
              final boundary = globalKey.currentContext!.findRenderObject()!
                  as RenderRepaintBoundary;
              ref
                  .read(makingPageProvider.notifier)
                  .exportToImage(boundary: boundary);
              finishSaverDialog(
                context: context,
                backCount: 0,
              );
            },
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
            CircleAvatar(
              radius: 50,
              child: Stack(
                children: [
                  if (iconImage != null)
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
}
