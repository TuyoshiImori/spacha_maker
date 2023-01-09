import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spacha_maker/ui/pages/introduction_page/introduction_page.dart';
import 'package:spacha_maker/ui/pages/making_page/making_page.dart';
import 'package:spacha_maker/ui/pages/other_page/other_page.dart';
import 'package:spacha_maker/ui/pages/printing_page/printing_page.dart';

class RouteGenerator {
  RouteGenerator._();

  static const String makingPage = '/making_page';
  static const String otherPage = '/other_page';
  static const String printingPage = '/printing_page';
  static const String introductionPage = '/introduction_page';

  static Route<T> generateRoute<T>(RouteSettings settings) {
    final args = settings.arguments;
    late PrintingArguments printingArguments;
    if (args is PrintingArguments) {
      printingArguments = args;
    }
    switch (settings.name) {
      case makingPage:
        return PageTransition<T>(
          child: MakingPage(),
          type: PageTransitionType.rightToLeft,
          settings: const RouteSettings(name: 'making_page'),
        );
      case otherPage:
        return PageTransition<T>(
          child: const OtherPage(),
          type: PageTransitionType.rightToLeft,
          settings: const RouteSettings(name: 'other_page'),
        );
      case printingPage:
        return PageTransition<T>(
          child: PrintingPage(
            printingArguments: printingArguments,
          ),
          type: PageTransitionType.rightToLeft,
          settings: const RouteSettings(name: 'printing_page'),
        );
      case introductionPage:
        return PageTransition<T>(
          child: const IntroductionPage(),
          type: PageTransitionType.rightToLeft,
          settings: const RouteSettings(name: 'introduction_page'),
        );
      // 該当しない場合エラー
      default:
        throw Exception('Route not found');
    }
  }
}
