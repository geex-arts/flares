import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nf_icon_placeholder_model.dart';
export 'nf_icon_placeholder_model.dart';

class NfIconPlaceholderWidget extends StatefulWidget {
  const NfIconPlaceholderWidget({super.key});

  @override
  State<NfIconPlaceholderWidget> createState() =>
      _NfIconPlaceholderWidgetState();
}

class _NfIconPlaceholderWidgetState extends State<NfIconPlaceholderWidget>
    with TickerProviderStateMixin {
  late NfIconPlaceholderModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NfIconPlaceholderModel());

    animationsMap.addAll({
      'stackOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('NF_ICON_PLACEHOLDER_COMP_Notify_ON_TAP');
        logFirebaseEvent('Notify_navigate_to');

        context.pushNamed('Notifications');
      },
      child: Container(
        width: 42.0,
        height: 38.0,
        child: Stack(
          alignment: AlignmentDirectional(0.0, 0.0),
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Image.asset(
                'assets/images/Rectangle.webp',
                width: 38.0,
                height: 38.0,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                child: Container(
                  width: 34.0,
                  height: 34.0,
                  decoration: BoxDecoration(
                    color: Color(0x9A000000),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Icon(
                    FFIcons.kbell,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ).animateOnPageLoad(animationsMap['stackOnPageLoadAnimation']!);
  }
}
