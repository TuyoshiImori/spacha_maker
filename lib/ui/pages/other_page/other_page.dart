import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:spacha_maker/controllers/pages/other_page_controller.dart';
import 'package:spacha_maker/routes.dart';
import 'package:spacha_maker/themes/app_colors.dart';
import 'package:spacha_maker/utils/theme_text.dart';
import 'package:spacha_maker/utils/url_launcher.dart';

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
                _buildHeading('アプリの設定'),
                _buildCustomCard(_buildUserSetting()),
                _buildHeading('このアプリについて'),
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
              caption: '設定アプリを開く',
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
        final isAvailable =
            ref.watch(otherPageProvider.select((s) => s.isAvailable));
        return Column(
          children: [
            _buildTransitionListItem(
              caption: 'アプリの紹介を見る',
              onTap: () async {
                await Navigator.of(context)
                    .pushNamed(RouteGenerator.introductionPage);
              },
            ),
            const Divider(),
            _buildTransitionListItem(
              caption: 'スパチャ封筒の折り方動画を見る',
              onTap: () async {
                await openLinkBrowser(url: 'https://youtu.be/tvVl_dtrLAw');
              },
            ),
            if (isAvailable) const Divider(),
            if (isAvailable)
              _buildTransitionListItem(
                caption: 'このアプリをレビューする',
                onTap: () async {
                  if (isAvailable) {
                    await ref.read(otherPageProvider.notifier).requestReview();
                  }
                },
              ),
            const Divider(),
            _buildTransitionListItem(
              caption: 'このアプリをシェアする',
              onTap: () async {
                final box = context.findRenderObject() as RenderBox?;
                await Share.share(
                  'https://apps.apple.com/jp/app/%E3%82%B9%E3%83%91%E3%83%81%E3%83%A3%E3%83%A1%E3%83%BC%E3%82%AB%E3%83%BC/id1665374806',
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
              caption: '作成者のTwitter',
              onTap: () async {
                await openLinkBrowser(url: 'https://twitter.com/imorin_basson');
              },
            ),
            const Divider(),
            _buildTransitionListItem(
              caption: '不具合・お問い合わせ',
              onTap: () async {
                await urlLauncherMail(
                  email: 'tos.and.privacy.policy@gmail.com',
                  title: 'スパチャメーカー　不具合・お問い合わせ',
                  content: '',
                );
              },
            ),
            const Divider(),
            _buildTransitionListItem(
              caption: '利用規約・プライバシーポリシー',
              onTap: () async {
                await openLinkAppBrowser(
                  url: 'https://tos-and-privacy-policy.web.app/',
                );
              },
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

  Widget _buildTransitionListItem({
    required String caption,
    required void Function() onTap,
    Widget? appIcon,
    Widget? selectedIcon,
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
            appIcon ?? BodyText1Text(caption),
            selectedIcon ??
                const Icon(
                  Icons.keyboard_arrow_right,
                  size: 20,
                  color: grey,
                ),
          ],
        ),
      ),
    );
  }
}
