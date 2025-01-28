import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowWebWidget extends ConsumerStatefulWidget {
  const ShowWebWidget({super.key, required this.route, required this.title});

  final String route;
  final String title;

  @override
  ConsumerState<ShowWebWidget> createState() => ShowWebWidgetState();
}

class ShowWebWidgetState extends ConsumerState<ShowWebWidget> {
  WebViewController ini() {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setNavigationDelegate(
        NavigationDelegate(
            onProgress: (int progress) {},
            onPageStarted: (String url) {},
            onPageFinished: (String url) {},
            onWebResourceError: (WebResourceError error) {},
            onNavigationRequest: (NavigationRequest request) =>
            NavigationDecision.navigate,),
      )
      ..loadRequest(Uri.parse(widget.route));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
        body: Column(children: [
          Expanded(child: WebViewWidget(controller: ini())),
        ],),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: FloatingActionButton(
          heroTag: widget.key.toString(),
            onPressed: copyToClip, child: const Icon(Icons.copy),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  copyToClip() {
    Clipboard.setData(
        ClipboardData(text: 'https://${ref.watch(globalDataServiceProvider).host}/${widget.route}'),);
    Fluttertoast.showToast(
      msg: "${widget.title} url copied to clipboard", // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.CENTER,
    );
  }
}
