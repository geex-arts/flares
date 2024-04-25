import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'b_s_ask_day_widget.dart' show BSAskDayWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BSAskDayModel extends FlutterFlowModel<BSAskDayWidget> {
  ///  Local state fields for this component.

  DateTime? selectedDate;

  bool? checkedField = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for Carousel widget.
  CarouselController? carouselController1;

  int carouselCurrentIndex1 = 1;

  // State field(s) for Carousel widget.
  CarouselController? carouselController2;

  int carouselCurrentIndex2 = 1;

  // State field(s) for Carousel widget.
  CarouselController? carouselController3;

  int carouselCurrentIndex3 = 0;

  // State field(s) for Hours widget.
  CarouselController? hoursController;

  int hoursCurrentIndex = 1;

  // State field(s) for Carousel widget.
  CarouselController? carouselController4;

  int carouselCurrentIndex4 = 1;

  // State field(s) for Carousel widget.
  CarouselController? carouselController5;

  int carouselCurrentIndex5 = 0;

  // Model for pinkButton component.
  late PinkButtonModel pinkButtonModel;
  // Stores action output result for [Backend Call - Insert Row] action in pinkButton widget.
  DatesRow? newDateRow;

  @override
  void initState(BuildContext context) {
    pinkButtonModel = createModel(context, () => PinkButtonModel());
  }

  @override
  void dispose() {
    pinkButtonModel.dispose();
  }
}
