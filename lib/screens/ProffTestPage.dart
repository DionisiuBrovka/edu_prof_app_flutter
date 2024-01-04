import 'package:edu_prof_app_flutter/elements/NavBar.dart';
import 'package:edu_prof_app_flutter/elements/WebViewNavigationControls.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProffTestPage extends StatefulWidget {
  const ProffTestPage({super.key});

  @override
  State<ProffTestPage> createState() => _ProffTestPageState();
}

class _ProffTestPageState extends State<ProffTestPage> {
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
          WebViewNavigationControls(controller: controller),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
      drawer: NavBar(),
    );
  }
}
