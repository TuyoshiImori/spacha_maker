import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spacha_maker/ui/pages/other_page/other_page.dart';

class RouteGenerator {
  RouteGenerator._();
  static const String otherPage = '/other_page';
  static Route<T> generateRoute<T>(RouteSettings settings) {
    switch (settings.name) {
      case otherPage:
        return PageTransition<T>(
          child: const OtherPage(),
          type: PageTransitionType.rightToLeft,
          settings: const RouteSettings(name: 'other_page'),
        );
      // 該当しない場合エラー
      default:
        throw Exception('Route not found');
    }
  }
}
