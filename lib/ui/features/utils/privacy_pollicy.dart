import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPollicy extends StatelessWidget {
  const PrivacyPollicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final Uri url = Uri.parse('https://google.com');

        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
      child: const Text(
        "Política de Privacidade",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

