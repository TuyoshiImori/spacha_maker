import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spacha_maker/ui/pages/other_page/other_page.dart';
import 'package:spacha_maker/ui/pages/printing_page/printing_page.dart';

class RouteGenerator {
  RouteGenerator._();

  static const String otherPage = '/other_page';
  static const String printingPage = '/printing_page';

  static Route<T> generateRoute<T>(RouteSettings settings) {
    final args = settings.arguments;
    late PrintingArguments printingArguments;
    if (args is PrintingArguments) {
      printingArguments = args;
    }
    switch (settings.name) {
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
        ); // 該当しない場合エラー
      default:
        throw Exception('Route not found');
    }
  }
}
