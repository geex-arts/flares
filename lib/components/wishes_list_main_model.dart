import '/backend/supabase/supabase.dart';
import '/components/card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'wishes_list_main_widget.dart' show WishesListMainWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WishesListMainModel extends FlutterFlowModel<WishesListMainWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in wishesListMain widget.
  List<ReactionImagesRow>? reactionImagesRows;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
