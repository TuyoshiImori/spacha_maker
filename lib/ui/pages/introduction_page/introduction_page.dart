import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacha_maker/controllers/global/app_controller.dart';
import 'package:spacha_maker/gen/assets.gen.dart';
import 'package:spacha_maker/routes.dart';
import 'package:spacha_maker/themes/app_colors.dart';

class IntroductionPage extends ConsumerWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'スパチャメーカーについて',
              body: 'このアプリでは\nYouTubeの投げ銭機能でよく見る'
                  '\nスーパーチャット（スパチャ）の'
                  '\n画像を作成・保存することができます！',
              image: Assets.images.introductionSpacha.image(),
              decoration: const PageDecoration(
                pageColor: white,
              ),
            ),
            PageViewModel(
              title: 'スパチャ封筒について',
              body: 'オリジナルのスパチャ画像を使った\n封筒を印刷して作ることができます！'
                  '\n（アプリから印刷するには\nwifi対応のコピー機が必要です）',
              image: Assets.images.introductionEnvelope.image(),
              decoration: const PageDecoration(
                pageColor: white,
              ),
            ),
            //PageViewModel(),
          ],
          onDone: () async {
            final haveSeenIntro =
                await ref.read(appProvider.notifier).haveSeenIntro();
            if (haveSeenIntro) {
              Navigator.pop(context);
            } else {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('haveSeenIntro', true);
              await Navigator.of(context)
                  .pushReplacementNamed(RouteGenerator.makingPage);
            }
          },
          showBackButton: true,
          next: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: spachaLightYellow,
          ),
          back: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: spachaLightYellow,
          ),
          done: const Text(
            'OK!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: spachaLightYellow,
            ),
          ),
          globalBackgroundColor: white,
          dotsDecorator: DotsDecorator(
            size: const Size.square(10),

            // ここの大きさを変更することで
            // 現在の位置を表しているマーカーのUIが変更するよ!
            activeSize: const Size(20, 10),
            activeColor: spachaYellow,
            color: spachaLightYellow,
            spacing: const EdgeInsets.symmetric(horizontal: 3),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
