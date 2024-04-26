import '/flutter_flow/flutter_flow_util.dart';
import 'stories_view_widget.dart' show StoriesViewWidget;
import 'package:flutter/material.dart';

class StoriesViewModel extends FlutterFlowModel<StoriesViewWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
