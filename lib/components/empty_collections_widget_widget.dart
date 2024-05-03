import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_collections_widget_model.dart';
export 'empty_collections_widget_model.dart';

class EmptyCollectionsWidgetWidget extends StatefulWidget {
  const EmptyCollectionsWidgetWidget({super.key});

  @override
  State<EmptyCollectionsWidgetWidget> createState() =>
      _EmptyCollectionsWidgetWidgetState();
}

class _EmptyCollectionsWidgetWidgetState
    extends State<EmptyCollectionsWidgetWidget> {
  late EmptyCollectionsWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyCollectionsWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 30.0),
      child: Container(
        width: 224.0,
        height: 145.0,
        decoration: BoxDecoration(
          color: const Color(0x0DFFFFFF),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.find_in_page_outlined,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Text(
                'No Collections Yet',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nuckle',
                      color: FlutterFlowTheme.of(context).info,
                      fontSize: 17.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: false,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Text(
                'You don\'t have any\nCollections',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Nuckle',
                      color: const Color(0x9AFFFFFF),
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts: false,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
