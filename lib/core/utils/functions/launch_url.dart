import 'package:bookly/core/utils/functions/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl({required BuildContext context,required String url,required String text}) async {
  Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    // ignore: use_build_context_synchronously
    showSnackBar(context: context,text: text,color: Colors.red);
  }
}
