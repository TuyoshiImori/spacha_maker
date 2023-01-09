import 'package:url_launcher/url_launcher.dart';

Future<void> openLinkAppBrowser({required String url}) async {
  final encode = Uri.parse(url);
  if (await canLaunchUrl(encode)) {
    await launchUrl(
      encode,
      mode: LaunchMode.inAppWebView,
      // forceSafariVC: true, //iOSでアプリ内かブラウザのどちらかでURLを開くか決める。
      // forceWebView: true, //Androidでアプリ内かブラウザのどちらかでURLを開くか決める。
      // universalLinksOnly: true,
    );
  }
}

Future<void> openLinkBrowser({required String url}) async {
  final encode = Uri.parse(url);
  if (await canLaunchUrl(encode)) {
    await launchUrl(
      encode,
      mode: LaunchMode.externalApplication,
      // forceSafariVC: false, //iOSでアプリ内かブラウザのどちらかでURLを開くか決める。
      // forceWebView: false, //Androidでアプリ内かブラウザのどちらかでURLを開くか決める。
      // universalLinksOnly: false,
    );
  }
}

Future<void> urlLauncherMail({
  required String email,
  required String title,
  required String content,
}) {
  final emailLaunchUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      'subject': title,
      'body': content,
    },
  );
  return launchUrl(
    emailLaunchUri,
  );
}
