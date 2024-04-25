import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_add_tour_own_model.dart';
export 'empty_add_tour_own_model.dart';

class EmptyAddTourOwnWidget extends StatefulWidget {
  const EmptyAddTourOwnWidget({super.key});

  @override
  State<EmptyAddTourOwnWidget> createState() => _EmptyAddTourOwnWidgetState();
}

class _EmptyAddTourOwnWidgetState extends State<EmptyAddTourOwnWidget> {
  late EmptyAddTourOwnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyAddTourOwnModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 29.0,
            height: 29.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(10.0),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 20.0,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
            child: Text(
              'Add Your Own',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Nuckle',
                    color: FlutterFlowTheme.of(context).info,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
