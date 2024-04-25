import '/components/generate_with_a_i_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_add_wishes/b_s_add_wishes_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'new_list_model.dart';
export 'new_list_model.dart';

class NewListWidget extends StatefulWidget {
  const NewListWidget({
    super.key,
    bool? noWishes,
  }) : this.noWishes = noWishes ?? true;

  final bool noWishes;

  @override
  State<NewListWidget> createState() => _NewListWidgetState();
}

class _NewListWidgetState extends State<NewListWidget> {
  late NewListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (widget.noWishes)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 16.0),
            child: Container(
              width: double.infinity,
              height: 73.0,
              decoration: BoxDecoration(
                color: Color(0x1AFFFFFF),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Color(0x0FFFFFFF),
                        shape: BoxShape.circle,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        FFIcons.kdocumentSearch,
                        color: FlutterFlowTheme.of(context).info,
                        size: 22.0,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Add or import your first wish',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'NEW_LIST_COMP_Container_ipwmalw1_ON_TAP');
                          logFirebaseEvent('Container_bottom_sheet');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.85,
                                    child: BSAddWishesWidget(),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        child: Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).pinkButton,
                            ),
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 3.0, 12.0, 0.0),
                            child: Text(
                              'How it Works?',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (widget.noWishes)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Container(
              height: 24.0,
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: Color(0x19FFFFFF),
                          ),
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 6.0, 16.0, 0.0),
                          child: Text(
                            'Or',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nuckle',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 1.0,
                          decoration: BoxDecoration(
                            color: Color(0x19FFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
              24.0,
              valueOrDefault<double>(
                widget.noWishes ? 0.0 : 16.0,
                0.0,
              ),
              24.0,
              0.0),
          child: wrapWithModel(
            model: _model.generateWithAIModel,
            updateCallback: () => setState(() {}),
            child: GenerateWithAIWidget(),
          ),
        ),
      ],
    );
  }
}
