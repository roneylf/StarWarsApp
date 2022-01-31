import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewPage extends StatefulWidget {
  final String title;
  const WebviewPage({Key? key, this.title = 'WebviewPage'}) : super(key: key);
  @override
  WebviewPageState createState() => WebviewPageState();
}

class WebviewPageState extends State<WebviewPage> {
  bool _isLoading = true;
  // ignore: unused_field
  late InAppWebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          InAppWebView(
            initialUrlRequest:
                URLRequest(url: Uri.parse("https://starwars.com/community")),
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;
            },
            onLoadStart: (controller, url) {
              setState(() {
                _isLoading = true;
              });
            },
            onLoadStop: (controller, url) async {
              setState(
                () {
                  _isLoading = false;
                },
              );
            },
            onLoadError: (controller, url, number, description) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
