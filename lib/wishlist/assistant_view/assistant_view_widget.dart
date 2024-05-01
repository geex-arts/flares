import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'assistant_view_model.dart';
export 'assistant_view_model.dart';

class AssistantViewWidget extends StatefulWidget {
  const AssistantViewWidget({
    super.key,
    this.aiAssistantLink,
  });

  final String? aiAssistantLink;

  @override
  State<AssistantViewWidget> createState() => _AssistantViewWidgetState();
}

class _AssistantViewWidgetState extends State<AssistantViewWidget>
    with TickerProviderStateMixin {
  late AssistantViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssistantViewModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Assistant_View'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ASSISTANT_VIEW_Assistant_View_ON_INIT_ST');
      logFirebaseEvent('Assistant_View_wait__delay');
      await Future.delayed(const Duration(milliseconds: 2000));
      logFirebaseEvent('Assistant_View_update_page_state');
      setState(() {
        _model.isLoading = false;
      });
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF931293),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 47.0, 0.0, 0.0),
                child: custom_widgets.AiAssistantWebview(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  url: widget.aiAssistantLink!,
                ),
              ),
            ),
            if (_model.isLoading)
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/Background.webp',
                      ).image,
                    ),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: Image.asset(
                        'assets/images/logo.webp',
                        width: 155.0,
                        height: 157.0,
                        fit: BoxFit.cover,
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation']!),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
