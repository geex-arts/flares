import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'dates_loading_widget_model.dart';
export 'dates_loading_widget_model.dart';

class DatesLoadingWidgetWidget extends StatefulWidget {
  const DatesLoadingWidgetWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final int? parameter1;
  final int? parameter2;
  final List<String>? parameter3;

  @override
  State<DatesLoadingWidgetWidget> createState() =>
      _DatesLoadingWidgetWidgetState();
}

class _DatesLoadingWidgetWidgetState extends State<DatesLoadingWidgetWidget> {
  late DatesLoadingWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatesLoadingWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '0',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Nuckle',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 12.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  useGoogleFonts: false,
                  lineHeight: 1.4,
                ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Text(
              'Dates',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nuckle',
                    color: const Color(0x98FFFFFF),
                    fontSize: 12.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: false,
                    lineHeight: 1.4,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
