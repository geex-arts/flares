import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_save_to_collection/b_s_save_to_collection_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'card_a_i_widget.dart' show CardAIWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CardAIModel extends FlutterFlowModel<CardAIWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Insert Row] action in MainImage widget.
  WishesRow? newWishRow;
  // Stores action output result for [Backend Call - Insert Row] action in Icon widget.
  WishesRow? newWishRowIcon;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
