import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pink_button_model.dart';
export 'pink_button_model.dart';

class PinkButtonWidget extends StatefulWidget {
  const PinkButtonWidget({
    super.key,
    required this.text,
    required this.currentAction,
  });

  final String? text;
  final Future Function()? currentAction;

  @override
  State<PinkButtonWidget> createState() => _PinkButtonWidgetState();
}

class _PinkButtonWidgetState extends State<PinkButtonWidget> {
  late PinkButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () async {
        await widget.currentAction?.call();
      },
      text: widget.text!,
      options: FFButtonOptions(
        width: double.infinity,
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).pinkButton,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Nuckle',
              color: Colors.white,
              fontSize: 17.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
              useGoogleFonts: false,
            ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
