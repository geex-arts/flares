import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'd_save_to_collection_model.dart';
export 'd_save_to_collection_model.dart';

class DSaveToCollectionWidget extends StatefulWidget {
  const DSaveToCollectionWidget({super.key});

  @override
  State<DSaveToCollectionWidget> createState() =>
      _DSaveToCollectionWidgetState();
}

class _DSaveToCollectionWidgetState extends State<DSaveToCollectionWidget> {
  late DSaveToCollectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DSaveToCollectionModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0x18F2F1F3),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Container(
              width: 33.0,
              height: 4.0,
              decoration: const BoxDecoration(
                color: Color(0x3AF2F1F3),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 12.0),
            child: Text(
              'Save to Collections',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nuckle',
                    color: FlutterFlowTheme.of(context).info,
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          const Divider(
            thickness: 1.0,
            color: Color(0x0CF2F1F3),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
            child: Container(
              width: double.infinity,
              height: 38.0,
              decoration: BoxDecoration(
                color: const Color(0x17F2F1F3),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Nuckle',
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0x7FF2F1F3),
                    size: 18.0,
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nuckle',
                      color: FlutterFlowTheme.of(context).info,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
                minLines: null,
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 56.0,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13.0),
                        child: Image.network(
                          'https://picsum.photos/seed/34/600',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Healthy Nutrition',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 56.0,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13.0),
                        child: Image.network(
                          'https://picsum.photos/seed/34/600',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Healthy Nutrition',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 56.0,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13.0),
                        child: Image.network(
                          'https://picsum.photos/seed/34/600',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Healthy Nutrition',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 56.0,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13.0),
                        child: Image.network(
                          'https://picsum.photos/seed/34/600',
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Healthy Nutrition',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 28.0, 16.0, 45.0),
            child: FFButtonWidget(
              onPressed: () {
                print('SaveButton pressed ...');
              },
              text: 'Create new Collection',
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).pinkButton,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Nuckle',
                      color: Colors.white,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
