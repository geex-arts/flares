import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/floating_btn_widget.dart';
import '/components/tab_bar_widget.dart';
import '/components/wishes_list_main_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'couples_profile_widget.dart' show CouplesProfileWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CouplesProfileModel extends FlutterFlowModel<CouplesProfileWidget> {
  ///  Local state fields for this page.

  String? selectedCollectionID;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  Completer<List<WishesRow>>? requestCompleter;
  // Stores action output result for [Backend Call - API (generateAiWish)] action in Column widget.
  ApiCallResponse? apiResultc16Copy;
  // Model for wishesList.
  late WishesListMainModel wishesListModel;
  // Model for tabBar component.
  late TabBarModel tabBarModel;
  // Model for floatingBtn component.
  late FloatingBtnModel floatingBtnModel;

  @override
  void initState(BuildContext context) {
    wishesListModel = createModel(context, () => WishesListMainModel());
    tabBarModel = createModel(context, () => TabBarModel());
    floatingBtnModel = createModel(context, () => FloatingBtnModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    wishesListModel.dispose();
    tabBarModel.dispose();
    floatingBtnModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
