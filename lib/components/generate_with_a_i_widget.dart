import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_create_couple_ideas_with_a_i/b_s_create_couple_ideas_with_a_i_widget.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'generate_with_a_i_model.dart';
export 'generate_with_a_i_model.dart';

class GenerateWithAIWidget extends StatefulWidget {
  const GenerateWithAIWidget({super.key});

  @override
  State<GenerateWithAIWidget> createState() => _GenerateWithAIWidgetState();
}

class _GenerateWithAIWidgetState extends State<GenerateWithAIWidget> {
  late GenerateWithAIModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GenerateWithAIModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 73.0,
        decoration: BoxDecoration(
          color: const Color(0x1AFFFFFF),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '⚡️ Generate with AI',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nuckle',
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('GENERATE_WITH_A_I_Container_a2hb5xhy_ON_');
                  logFirebaseEvent('Container_bottom_sheet');
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return WebViewAware(
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: const BSCreateCoupleIdeasWithAIWidget(),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).pinkButton,
                    borderRadius: BorderRadius.circular(21.0),
                  ),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                    child: Text(
                      'Generate',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nuckle',
                            color: FlutterFlowTheme.of(context).info,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
