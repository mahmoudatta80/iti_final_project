import 'package:iti_final_project/core/utils/custom_toasts.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> launchCustomUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      CustomToasts.showErrorToast(
        errorMessage: 'Can\'t launch this url, please try again',
      );
    }
  }
}
