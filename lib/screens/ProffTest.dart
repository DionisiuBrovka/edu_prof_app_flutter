import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:edu_prof_app_flutter/elements/NavigationControls.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProffTest extends StatefulWidget {
  const ProffTest({super.key});

  @override
  State<ProffTest> createState() => _ProffTestState();
}

class _ProffTestState extends State<ProffTest> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://profitest.ripo.by/public/main'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Проф. тест'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).primaryColorLight,
        actions: [
          NavigationControls(controller: controller),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
      drawer: NavBar(),
    );
  }
}
