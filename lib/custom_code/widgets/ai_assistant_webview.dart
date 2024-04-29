// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:webviewx_plus/webviewx_plus.dart';

class AiAssistantWebview extends StatefulWidget {
  const AiAssistantWebview({
    super.key,
    this.width,
    this.height,
    required this.url,
  });

  final double? width;
  final double? height;
  final String url;

  @override
  State<AiAssistantWebview> createState() => _AiAssistantWebviewState();
}

class _AiAssistantWebviewState extends State<AiAssistantWebview> {
  late WebViewXController webviewController;

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebViewAware(
      child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
        WebViewAware(
          child: _buildWebViewX(),
        ),
        WebViewAware(
          child: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            alignment: AlignmentDirectional(1, -1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  0,
                  0,
                  0,
                  // widget.width! > 600 ? 74 : 3,
                  // widget.width! > 600 ? 20 : 3,
                  0),
              child: IconButton(
                iconSize: 40,
                icon: Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.transparent,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildWebViewX() {
    //final height = widget.height;
    //final width = widget.width;
    return WebViewX(
      key: const ValueKey('webviewx'),
      initialContent: widget.url,
      initialSourceType: SourceType.url,
      height: MediaQuery.sizeOf(context).height - 48,
      width: MediaQuery.sizeOf(context).width,
      onWebViewCreated: (controller) => webviewController = controller,
      //onPageStarted: (src) => _callPlatformIndependentJsMethod(),
      //onPageStarted: (src) => _callPlatformSpecificJsMethod(),
      //debugPrint('A new page has started loading: $src\n'),
      // onPageFinished: (src) => //_callPlatformIndependentJsMethod(),
      //     debugPrint('The page has finished loading: $src\n'),
      jsContent: {},
      dartCallBacks: {},
      webSpecificParams: const WebSpecificParams(
        printDebugInfo: true,
        additionalSandboxOptions: const [
          'allow-downloads',
          'allow-forms',
          'allow-modals',
          'allow-orientation-lock',
          'allow-pointer-lock',
          'allow-popups',
          'allow-popups-to-escape-sandbox',
          'allow-presentation'
              'allow-same-origin'
        ],
      ),
      mobileSpecificParams: const MobileSpecificParams(
        androidEnableHybridComposition: true,
      ),
      navigationDelegate: (navigation) {
        return NavigationDecision.navigate;
      },
    );
  }
}
