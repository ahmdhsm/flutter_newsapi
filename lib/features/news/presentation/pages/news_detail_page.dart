import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({
    super.key,
    required this.newsUrl,
  });

  final String newsUrl;

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool _loading = true;
  bool _error = false;
  late WebViewController _controller;

  @override
  void initState() {
    _controller = WebViewController()
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            setState(() {
              _loading = false;
            });
          },
          onHttpError: (_) {
            setState(() {
              _error = true;
            });
          },
          onWebResourceError: (_) {
            setState(() {
              _error = true;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.newsUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          if (_loading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (!_loading && !_error)
            WebViewWidget(
              controller: _controller,
            ),
          if (!_loading && _error)
            const Center(
              child: Text('Error'),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.setNavigationDelegate(NavigationDelegate());
    super.dispose();
  }
}
