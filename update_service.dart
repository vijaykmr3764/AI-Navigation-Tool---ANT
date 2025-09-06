import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateService {
  static Future<void> checkForUpdate(BuildContext context) async {
    try {
      final res = await http.get(Uri.parse("http://10.0.2.2:3000/api/version")); // local dev
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        final latestVersion = data["latest_version"];
        final changelog = data["changelog"];
        final updateUrl = data["update_url"];

        final packageInfo = await PackageInfo.fromPlatform();
        if (packageInfo.version != latestVersion) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Update Available 🚀"),
              content: Text("New version $latestVersion:\n\n$changelog"),
              actions: [
                TextButton(
                  child: const Text("Later"),
                  onPressed: () => Navigator.pop(context),
                ),
                ElevatedButton(
                  child: const Text("Update Now"),
                  onPressed: () async {
                    Navigator.pop(context);
                    final uri = Uri.parse(updateUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  },
                ),
              ],
            ),
          );
        }
      }
    } catch (e) {
      debugPrint("Update check failed: $e");
    }
  }
}
