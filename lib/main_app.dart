import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spacha_maker/controllers/global/app_controller.dart';
import 'package:spacha_maker/routes.dart';
import 'package:spacha_maker/themes/app_theme.dart';
import 'package:spacha_maker/ui/pages/introduction_page/introduction_page.dart';
import 'package:spacha_maker/ui/pages/making_page/making_page.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(appProvider.notifier).haveSeenIntro();
    final haveSeenIntro = ref.watch(appProvider.select((s) => s.haveSeenIntro));
    return MaterialApp(
      title: 'spacha_maker',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: const [Locale('ja', 'JP')],
      theme: theme(context),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: haveSeenIntro ? MakingPage() : const IntroductionPage(),
      //builder: EasyLoading.init(),
      builder: (context, child) {
        child = EasyLoading.init()(
          context,
          child,
        );
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child,
        );
      },
    );
  }
}
