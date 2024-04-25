import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'b_s_ask_day_copy_model.dart';
export 'b_s_ask_day_copy_model.dart';

class BSAskDayCopyWidget extends StatefulWidget {
  const BSAskDayCopyWidget({
    super.key,
    required this.selectedWishRow,
    required this.partnerID,
    bool? backgroundColor,
  }) : this.backgroundColor = backgroundColor ?? false;

  final WishesRow? selectedWishRow;
  final String? partnerID;
  final bool backgroundColor;

  @override
  State<BSAskDayCopyWidget> createState() => _BSAskDayCopyWidgetState();
}

class _BSAskDayCopyWidgetState extends State<BSAskDayCopyWidget> {
  late BSAskDayCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSAskDayCopyModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('B_S_ASK_DAY_COPY_BS_Ask_DayCopy_ON_INIT_');
      logFirebaseEvent('BS_Ask_DayCopy_update_component_state');
      setState(() {
        _model.selectedDate = getCurrentTimestamp;
      });
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0),
        topLeft: Radius.circular(32.0),
        topRight: Radius.circular(32.0),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 16.0,
          sigmaY: 16.0,
        ),
        child: Container(
          width: double.infinity,
          height: 400.0,
          decoration: BoxDecoration(
            color: Color(0x33F2F1F3),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Container(
                      width: 33.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: Color(0x3AF2F1F3),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 16.0, 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Date Time',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Nuckle',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'B_S_ASK_DAY_COPY_Container_y8ug5caw_ON_T');
                            logFirebaseEvent(
                                'Container_update_component_state');
                            setState(() {
                              _model.checkedField = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x67767680),
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  9.0, 6.0, 9.0, 6.0),
                              child: Text(
                                _model.selectedDate != null
                                    ? dateTimeFormat(
                                        'MMM dd, yyyy', _model.selectedDate)
                                    : dateTimeFormat(
                                        'MMM dd, yyyy', getCurrentTimestamp),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Nuckle',
                                      color: _model.checkedField == false
                                          ? FlutterFlowTheme.of(context).pink
                                          : FlutterFlowTheme.of(context).info,
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'B_S_ASK_DAY_COPY_Container_a6qm131d_ON_T');
                              logFirebaseEvent(
                                  'Container_update_component_state');
                              setState(() {
                                _model.checkedField = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x65767680),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    9.0, 6.0, 9.0, 6.0),
                                child: Text(
                                  _model.selectedDate != null
                                      ? dateTimeFormat(
                                          'h:mm a', _model.selectedDate)
                                      : dateTimeFormat(
                                          'h:mm a', getCurrentTimestamp),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Nuckle',
                                        color: _model.checkedField == true
                                            ? FlutterFlowTheme.of(context).pink
                                            : FlutterFlowTheme.of(context).info,
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: Color(0x0CF2F1F3),
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 90.0),
                  child: Builder(
                    builder: (context) {
                      if (_model.checkedField == false) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 25.0),
                          child: Container(
                            width: 254.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 45.0,
                                  height: 156.0,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final currentDay =
                                          functions.returnDays(31).toList();
                                      return Container(
                                        width: 40.0,
                                        height: 156.0,
                                        child: CarouselSlider.builder(
                                          itemCount: currentDay.length,
                                          itemBuilder:
                                              (context, currentDayIndex, _) {
                                            final currentDayItem =
                                                currentDay[currentDayIndex];
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                currentDayItem.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController1 ??=
                                                  CarouselController(),
                                          options: CarouselOptions(
                                            initialPage: min(
                                                valueOrDefault<int>(
                                                  int.parse(dateTimeFormat('d',
                                                          getCurrentTimestamp)) -
                                                      1,
                                                  0,
                                                ),
                                                currentDay.length - 1),
                                            viewportFraction: 0.22,
                                            disableCenter: false,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.3,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.vertical,
                                            autoPlay: false,
                                            onPageChanged: (index, _) async {
                                              _model.carouselCurrentIndex1 =
                                                  index;
                                              logFirebaseEvent(
                                                  'B_S_ASK_DAY_COPY_Carousel_iusr56fq_ON_WI');
                                              logFirebaseEvent(
                                                  'Carousel_update_component_state');
                                              setState(() {
                                                _model.selectedDate = functions
                                                    .returnSelectedDate(
                                                        (int var1) {
                                                          return '${var1 + 1}';
                                                        }(_model
                                                            .carouselCurrentIndex1),
                                                        dateTimeFormat(
                                                            'M',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'yyyy',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'h',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'mm',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'a',
                                                            _model
                                                                .selectedDate));
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: 134.0,
                                  height: 156.0,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final currentMonth =
                                          functions.returnMonths().toList();
                                      return Container(
                                        width: 40.0,
                                        height: 156.0,
                                        child: CarouselSlider.builder(
                                          itemCount: currentMonth.length,
                                          itemBuilder:
                                              (context, currentMonthIndex, _) {
                                            final currentMonthItem =
                                                currentMonth[currentMonthIndex];
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                currentMonthItem,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController2 ??=
                                                  CarouselController(),
                                          options: CarouselOptions(
                                            initialPage: min(
                                                valueOrDefault<int>(
                                                  int.parse(dateTimeFormat('M',
                                                          getCurrentTimestamp)) -
                                                      1,
                                                  0,
                                                ),
                                                currentMonth.length - 1),
                                            viewportFraction: 0.22,
                                            disableCenter: false,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.3,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.vertical,
                                            autoPlay: false,
                                            onPageChanged: (index, _) async {
                                              _model.carouselCurrentIndex2 =
                                                  index;
                                              logFirebaseEvent(
                                                  'B_S_ASK_DAY_COPY_Carousel_y12crgcb_ON_WI');
                                              logFirebaseEvent(
                                                  'Carousel_update_component_state');
                                              setState(() {
                                                _model.selectedDate = functions
                                                    .returnSelectedDate(
                                                        dateTimeFormat(
                                                            'd',
                                                            _model
                                                                .selectedDate),
                                                        (int var1) {
                                                          return '${var1 + 1}';
                                                        }(_model
                                                            .carouselCurrentIndex2),
                                                        dateTimeFormat(
                                                            'yyyy',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'h',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'mm',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'a',
                                                            _model
                                                                .selectedDate));
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: 60.0,
                                  height: 156.0,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final currentYear =
                                          functions.returnYears().toList();
                                      return Container(
                                        width: 40.0,
                                        height: 156.0,
                                        child: CarouselSlider.builder(
                                          itemCount: currentYear.length,
                                          itemBuilder:
                                              (context, currentYearIndex, _) {
                                            final currentYearItem =
                                                currentYear[currentYearIndex];
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                currentYearItem.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController3 ??=
                                                  CarouselController(),
                                          options: CarouselOptions(
                                            initialPage: min(
                                                valueOrDefault<int>(
                                                  functions
                                                      .returnYears()
                                                      .toList()
                                                      .indexOf(int.parse(
                                                          dateTimeFormat('yyyy',
                                                              getCurrentTimestamp))),
                                                  0,
                                                ),
                                                currentYear.length - 1),
                                            viewportFraction: 0.22,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.3,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.vertical,
                                            autoPlay: false,
                                            onPageChanged: (index, _) async {
                                              _model.carouselCurrentIndex3 =
                                                  index;
                                              logFirebaseEvent(
                                                  'B_S_ASK_DAY_COPY_Carousel_td3v31tb_ON_WI');
                                              logFirebaseEvent(
                                                  'Carousel_update_component_state');
                                              setState(() {
                                                _model.selectedDate = functions
                                                    .returnSelectedDate(
                                                        dateTimeFormat(
                                                            'd',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'M',
                                                            _model
                                                                .selectedDate),
                                                        ((int var1,
                                                                    List<int>
                                                                        var2) {
                                                          return var2[var1];
                                                        }(
                                                                _model
                                                                    .carouselCurrentIndex3,
                                                                functions
                                                                    .returnYears()
                                                                    .toList()))
                                                            .toString(),
                                                        dateTimeFormat(
                                                            'h',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'mm',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'a',
                                                            _model
                                                                .selectedDate));
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 25.0),
                          child: Container(
                            width: 254.0,
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 45.0,
                                  height: 156.0,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final curentHour =
                                          functions.returnDays(12).toList();
                                      return Container(
                                        width: 40.0,
                                        height: 156.0,
                                        child: CarouselSlider.builder(
                                          itemCount: curentHour.length,
                                          itemBuilder:
                                              (context, curentHourIndex, _) {
                                            final curentHourItem =
                                                curentHour[curentHourIndex];
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                curentHourItem.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            );
                                          },
                                          carouselController:
                                              _model.hoursController ??=
                                                  CarouselController(),
                                          options: CarouselOptions(
                                            initialPage: min(
                                                valueOrDefault<int>(
                                                  (String var1) {
                                                    return int.parse(var1
                                                            .replaceAll(
                                                                'PM', '')
                                                            .replaceAll(
                                                                'AM', '')) -
                                                        1;
                                                  }(dateTimeFormat('j',
                                                      getCurrentTimestamp)),
                                                  0,
                                                ),
                                                curentHour.length - 1),
                                            viewportFraction: 0.22,
                                            disableCenter: false,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.3,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.vertical,
                                            autoPlay: false,
                                            onPageChanged: (index, _) async {
                                              _model.hoursCurrentIndex = index;
                                              logFirebaseEvent(
                                                  'B_S_ASK_DAY_COPY_Hours_ON_WIDGET_SWIPE');
                                              logFirebaseEvent(
                                                  'Hours_update_component_state');
                                              setState(() {
                                                _model.selectedDate = functions
                                                    .returnSelectedDate(
                                                        dateTimeFormat(
                                                            'd',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'M',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'yyyy',
                                                            _model
                                                                .selectedDate),
                                                        (int var1) {
                                                          return '${var1 + 1}';
                                                        }(_model
                                                            .hoursCurrentIndex),
                                                        dateTimeFormat(
                                                            'mm',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'a',
                                                            _model
                                                                .selectedDate));
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: 134.0,
                                  height: 156.0,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final currentMinute =
                                          functions.returnDays(59).toList();
                                      return Container(
                                        width: 40.0,
                                        height: 156.0,
                                        child: CarouselSlider.builder(
                                          itemCount: currentMinute.length,
                                          itemBuilder:
                                              (context, currentMinuteIndex, _) {
                                            final currentMinuteItem =
                                                currentMinute[
                                                    currentMinuteIndex];
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                currentMinuteItem.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Nuckle',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .info,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController4 ??=
                                                  CarouselController(),
                                          options: CarouselOptions(
                                            initialPage: min(
                                                valueOrDefault<int>(
                                                  int.parse(dateTimeFormat('mm',
                                                          getCurrentTimestamp)) -
                                                      1,
                                                  0,
                                                ),
                                                currentMinute.length - 1),
                                            viewportFraction: 0.22,
                                            disableCenter: false,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.3,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.vertical,
                                            autoPlay: false,
                                            onPageChanged: (index, _) async {
                                              _model.carouselCurrentIndex4 =
                                                  index;
                                              logFirebaseEvent(
                                                  'B_S_ASK_DAY_COPY_Carousel_8sfk6m7c_ON_WI');
                                              logFirebaseEvent(
                                                  'Carousel_update_component_state');
                                              setState(() {
                                                _model.selectedDate = functions
                                                    .returnSelectedDate(
                                                        dateTimeFormat(
                                                            'd',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'M',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'yyyy',
                                                            _model
                                                                .selectedDate),
                                                        dateTimeFormat(
                                                            'h',
                                                            _model
                                                                .selectedDate),
                                                        (int var1) {
                                                          return '${var1 + 1}';
                                                        }(_model
                                                            .carouselCurrentIndex4),
                                                        dateTimeFormat(
                                                            'a',
                                                            _model
                                                                .selectedDate));
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  width: 60.0,
                                  height: 156.0,
                                  decoration: BoxDecoration(),
                                  child: Container(
                                    width: 40.0,
                                    height: 156.0,
                                    child: CarouselSlider(
                                      items: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'AM',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Nuckle',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            'PM',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge
                                                .override(
                                                  fontFamily: 'Nuckle',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .info,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                      carouselController:
                                          _model.carouselController5 ??=
                                              CarouselController(),
                                      options: CarouselOptions(
                                        initialPage: min(
                                            valueOrDefault<int>(
                                              (String var1) {
                                                return var1 == 'AM' ? 0 : 1;
                                              }(dateTimeFormat(
                                                  's', getCurrentTimestamp)),
                                              0,
                                            ),
                                            1),
                                        viewportFraction: 0.22,
                                        disableCenter: true,
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.3,
                                        enableInfiniteScroll: false,
                                        scrollDirection: Axis.vertical,
                                        autoPlay: false,
                                        onPageChanged: (index, _) async {
                                          _model.carouselCurrentIndex5 = index;
                                          logFirebaseEvent(
                                              'B_S_ASK_DAY_COPY_Carousel_lm9djui7_ON_WI');
                                          logFirebaseEvent(
                                              'Carousel_update_component_state');
                                          setState(() {
                                            _model.selectedDate =
                                                functions.returnSelectedDate(
                                                    dateTimeFormat('d',
                                                        _model.selectedDate),
                                                    dateTimeFormat('M',
                                                        _model.selectedDate),
                                                    dateTimeFormat('yyyy',
                                                        _model.selectedDate),
                                                    dateTimeFormat('h',
                                                        _model.selectedDate),
                                                    dateTimeFormat('mm',
                                                        _model.selectedDate),
                                                    (int var1) {
                                                      return var1 == 0
                                                          ? 'AM'
                                                          : 'PM';
                                                    }(_model
                                                        .carouselCurrentIndex5));
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Builder(
                  builder: (context) => Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 40.0),
                    child: wrapWithModel(
                      model: _model.pinkButtonModel,
                      updateCallback: () => setState(() {}),
                      child: PinkButtonWidget(
                        text: 'Ask for a date',
                        currentAction: () async {
                          logFirebaseEvent(
                              'B_S_ASK_DAY_COPY_Container_0ymkt9fr_CALL');
                          logFirebaseEvent('pinkButton_backend_call');
                          unawaited(
                            () async {
                              _model.newDateRow = await DatesTable().insert({
                                'date_time': supaSerialize<DateTime>(
                                    _model.selectedDate),
                                'status': 'pending',
                                'wish': widget.selectedWishRow?.uuid,
                                'pair': FFAppState().pairID,
                                'created_by': currentUserUid,
                              });
                            }(),
                          );
                          logFirebaseEvent('pinkButton_backend_call');
                          unawaited(
                            () async {
                              await NotificationsTable().insert({
                                'from_user': currentUserUid,
                                'to_user': widget.partnerID,
                                'type': 'date',
                                'details': <String, String>{
                                  'link': widget.selectedWishRow!.link!,
                                  'wish_id': widget.selectedWishRow!.uuid,
                                  'wish_name': widget.selectedWishRow!.name!,
                                  'wish_image': widget.selectedWishRow!.photo!,
                                },
                              });
                            }(),
                          );
                          logFirebaseEvent('pinkButton_alert_dialog');
                          showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, -1.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: AlertDialogWarningWidget(
                                    title: 'Date created successfully !',
                                    subtitle: '',
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));

                          logFirebaseEvent('pinkButton_bottom_sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('pinkButton_navigate_back');
                          context.safePop();

                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
