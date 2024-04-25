import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_create_couple_ideas_with_a_i/b_s_create_couple_ideas_with_a_i_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'floating_btn_model.dart';
export 'floating_btn_model.dart';

class FloatingBtnWidget extends StatefulWidget {
  const FloatingBtnWidget({super.key});

  @override
  State<FloatingBtnWidget> createState() => _FloatingBtnWidgetState();
}

class _FloatingBtnWidgetState extends State<FloatingBtnWidget> {
  late FloatingBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FloatingBtnModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 104.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('FLOATING_BTN_COMP_FloatButton_ON_TAP');
            logFirebaseEvent('FloatButton_bottom_sheet');
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return WebViewAware(
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: BSCreateCoupleIdeasWithAIWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          child: Container(
            width: 130.0,
            height: 54.0,
            child: Stack(
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                ))
                  Align(
                    alignment: AlignmentDirectional(1.0, 1.0),
                    child: Container(
                      height: 54.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).pink,
                        borderRadius: BorderRadius.circular(100.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            14.0, 0.0, 14.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FFIcons.kstars,
                              color: FlutterFlowTheme.of(context).info,
                              size: 26.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'All Wishes',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nuckle',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Align(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  child: Container(
                    width: 54.0,
                    height: 54.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).pink,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FFIcons.kstars,
                      color: FlutterFlowTheme.of(context).info,
                      size: 26.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
