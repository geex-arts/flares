import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
        color: const Color(0x00FFFFFF),
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
