import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SystemService {
  static Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  static Future<void> launchPhoneDialer() async {
    // Note: Since we don't have phone numbers strictly required by the PRD,
    // we can just open the dialer generically. If the user input a number instead of a name,
    // we could try to parse it, but for now we just open the standard dial array.
    final uri = Uri.parse('tel:');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch dialer');
    }
  }
}
