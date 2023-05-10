import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../const/colors/colors.dart';

class VimeoPlayer extends StatefulWidget {
  @override
  _VimeoPlayerState createState() => _VimeoPlayerState();
}

class _VimeoPlayerState extends State<VimeoPlayer> {
  final String vimeoVideoUrl =
      'https://player.vimeo.com/video/759401631?h=27f2be5876';

  @override
  Widget build(BuildContext context) {
    return  WebView(
      initialUrl: vimeoVideoUrl,
      backgroundColor: black,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
