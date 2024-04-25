import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nf_loading_placeholder_model.dart';
export 'nf_loading_placeholder_model.dart';

class NfLoadingPlaceholderWidget extends StatefulWidget {
  const NfLoadingPlaceholderWidget({super.key});

  @override
  State<NfLoadingPlaceholderWidget> createState() =>
      _NfLoadingPlaceholderWidgetState();
}

class _NfLoadingPlaceholderWidgetState
    extends State<NfLoadingPlaceholderWidget> {
  late NfLoadingPlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NfLoadingPlaceholderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.0,
      height: 13.0,
      decoration: BoxDecoration(
        color: Color(0x00FFFFFF),
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
