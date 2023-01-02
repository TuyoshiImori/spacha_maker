import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spacha_maker/themes/app_colors.dart';
import 'package:spacha_maker/utils/theme_text.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(44),
        child: AppBar(
          elevation: 0,
        ),
      ),
      body: _settingPageBody(context),
    );
  }

  Widget _settingPageBody(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                _buildHeading('ユーザー設定'),
                _buildCustomCard(_buildUserSetting()),
                _buildHeading('ツクッテについて'),
                _buildCustomCard(_buildAboutApp()),
                _buildHeading('サポート・その他'),
                _buildCustomCard(_buildSupport()),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildUserSetting() {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          children: [
            _buildTransitionListItem(
              caption: '設定を変更する',
              onTap: () async {
                await openAppSettings();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildAboutApp() {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          children: [
            _buildTransitionListItem(
              caption: 'ツクッテをレビューする',
              onTap: () async {
                await openAppSettings();
              },
            ),
            const Divider(),
            _buildTransitionListItem(
              caption: 'ツクッテをシェアする',
              onTap: () async {
                final box = context.findRenderObject() as RenderBox?;

                ///TODO アプリのURLに変更
                await Share.share(
                  'ほげほげ',
                  sharePositionOrigin:
                      box!.localToGlobal(Offset.zero) & box.size,
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildSupport() {
    return Consumer(
      builder: (context, ref, _) {
        return Column(
          children: [
            _buildTransitionListItem(
              caption: '不具合・お問い合わせ',
              onTap: () async {},
            ),
            const Divider(),
            _buildTransitionListItem(
              caption: '利用規約',
              onTap: () async {},
            ),
            const Divider(),
            _buildTransitionListItem(
              caption: 'プライバシーポリシー',
              onTap: () async {},
            ),
          ],
        );
      },
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

  Widget _buildHeading(String caption) {
    return SizedBox(
      height: 46,
      child: Container(
        alignment: Alignment.bottomLeft,
        margin: const EdgeInsets.only(left: 16, bottom: 6),
        child: Subtitle2Text(caption, bottomPadding: 0),
      ),
    );
  }

  Widget _buildListItemForm({required String caption, required Widget button}) {
    return Container(
      height: 46,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BodyText1Text(caption),
          button,
        ],
      ),
    );
  }

  Widget _buildTransitionListItem({
    required String caption,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: _buildListItemForm(
        caption: caption,
        button: const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: grey,
        ),
      ),
    );
  }
}
