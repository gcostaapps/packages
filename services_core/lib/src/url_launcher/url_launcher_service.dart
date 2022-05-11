import 'package:services_core/services_core.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IUrlLauncherService {
  Future<bool> launchCustomUrl(String url);
  Future<bool> launchEmail(String subject);
}

class UrlLauncherServiceDesktop implements IUrlLauncherService {
  @override
  Future<bool> launchEmail(String subject) async => false;

  @override
  Future<bool> launchCustomUrl(String url) async => false;
}

class UrlLauncherService implements IUrlLauncherService {
  UrlLauncherService(this.logger);

  final ILogger logger;

  @override
  Future<bool> launchEmail(String subject) async {
    try {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'hello@appmytime.com',
        query: _encodeQueryParameters(<String, String>{'subject': subject}),
      );

      return launchUrl(emailLaunchUri);
    } catch (e) {
      logger.error(e.toString());
      return false;
    }
  }

  @override
  Future<bool> launchCustomUrl(String url) async {
    try {
      return launchUrl(Uri.parse(url));
    } catch (e) {
      logger.error(e.toString());
      return false;
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
