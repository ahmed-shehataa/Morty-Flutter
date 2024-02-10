import 'package:url_launcher/url_launcher.dart';

extension UrlLauncher on String {
  Future<void> openURL() async {
    var url = Uri.parse(this);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
