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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'b_s_ask_day_model.dart';
export 'b_s_ask_day_model.dart';

class BSAskDayWidget extends StatefulWidget {
  const BSAskDayWidget({
    super.key,
    required this.selectedWishRow,
    required this.partnerID,
  });

  final WishesRow? selectedWishRow;
  final String? partnerID;

  @override
  State<BSAskDayWidget> createState() => _BSAskDayWidgetState();
}

class _BSAskDayWidgetState extends State<BSAskDayWidget> {
  late BSAskDayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSAskDayModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
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
      borderRadius: const BorderRadius.only(
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
          decoration: const BoxDecoration(
            color: Color(0x18F2F1F3),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Container(
                  width: 33.0,
                  height: 4.0,
                  decoration: const BoxDecoration(
                    color: Color(0x3AF2F1F3),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 16.0, 16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Date Time',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nuckle',
                              color: FlutterFlowTheme.of(context).info,
                              fontSize: 17.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0x3C767680),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(9.0, 6.0, 9.0, 6.0),
                        child: Text(
                          _model.selectedDate != null
                              ? dateTimeFormat(
                                  'MMM dd, yyyy', _model.selectedDate)
                              : dateTimeFormat(
                                  'MMM dd, yyyy', getCurrentTimestamp),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showModalBottomSheet<bool>(
                              context: context,
                              builder: (context) {
                                final datePickedCupertinoTheme =
                                    CupertinoTheme.of(context);
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width,
                                  color: const Color(0xCB000000),
                                  child: CupertinoTheme(
                                    data: datePickedCupertinoTheme.copyWith(
                                      textTheme: datePickedCupertinoTheme
                                          .textTheme
                                          .copyWith(
                                        dateTimePickerTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .headlineMedium
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
                                    child: CupertinoDatePicker(
                                      mode: CupertinoDatePickerMode.time,
                                      minimumDate: DateTime(1900),
                                      initialDateTime: getCurrentTimestamp,
                                      maximumDate: DateTime(2050),
                                      backgroundColor: const Color(0xCB000000),
                                      use24hFormat: false,
                                      onDateTimeChanged: (newDateTime) =>
                                          safeSetState(() {
                                        _model.datePicked = newDateTime;
                                      }),
                                    ),
                                  ),
                                );
                              });
                          if (_model.datePicked != null) {
                            setState(() {
                              _model.selectedDate =
                                  functions.returnSelectedDate(
                                      dateTimeFormat('d', _model.selectedDate),
                                      dateTimeFormat('M', _model.selectedDate),
                                      dateTimeFormat(
                                          'yyyy', _model.selectedDate),
                                      dateTimeFormat('HH', _model.datePicked),
                                      dateTimeFormat('mm', _model.datePicked));
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0x3C767680),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                9.0, 6.0, 9.0, 6.0),
                            child: Text(
                              _model.datePicked != null
                                  ? dateTimeFormat('jm', _model.datePicked)
                                  : dateTimeFormat('jm', getCurrentTimestamp),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).pink,
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
              const Divider(
                thickness: 1.0,
                color: Color(0x0CF2F1F3),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 25.0),
                child: Container(
                  width: 254.0,
                  decoration: const BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 45.0,
                        height: 156.0,
                        decoration: const BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final currentDay = functions.returnDays().toList();
                            return SizedBox(
                              width: 40.0,
                              height: 156.0,
                              child: CarouselSlider.builder(
                                itemCount: currentDay.length,
                                itemBuilder: (context, currentDayIndex, _) {
                                  final currentDayItem =
                                      currentDay[currentDayIndex];
                                  return Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      currentDayItem.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
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
                                        int.parse(dateTimeFormat(
                                                'd', getCurrentTimestamp)) -
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
                                    _model.carouselCurrentIndex1 = index;
                                    setState(() {
                                      _model.selectedDate =
                                          functions.returnSelectedDate(
                                              (int var1) {
                                                return '${var1 + 1}';
                                              }(_model.carouselCurrentIndex1),
                                              dateTimeFormat(
                                                  'M', _model.selectedDate),
                                              dateTimeFormat(
                                                  'yyyy', _model.selectedDate),
                                              dateTimeFormat(
                                                  'HH', _model.selectedDate),
                                              dateTimeFormat(
                                                  'mm', _model.selectedDate));
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
                        decoration: const BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final currentMonth =
                                functions.returnMonths().toList();
                            return SizedBox(
                              width: 40.0,
                              height: 156.0,
                              child: CarouselSlider.builder(
                                itemCount: currentMonth.length,
                                itemBuilder: (context, currentMonthIndex, _) {
                                  final currentMonthItem =
                                      currentMonth[currentMonthIndex];
                                  return Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      currentMonthItem,
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
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
                                        int.parse(dateTimeFormat(
                                                'M', getCurrentTimestamp)) -
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
                                    _model.carouselCurrentIndex2 = index;
                                    setState(() {
                                      _model.selectedDate =
                                          functions.returnSelectedDate(
                                              dateTimeFormat(
                                                  'd', _model.selectedDate),
                                              (int var1) {
                                                return '${var1 + 1}';
                                              }(_model.carouselCurrentIndex2),
                                              dateTimeFormat(
                                                  'yyyy', _model.selectedDate),
                                              dateTimeFormat(
                                                  'HH', _model.selectedDate),
                                              dateTimeFormat(
                                                  'mm', _model.selectedDate));
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
                        decoration: const BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final currentYear =
                                functions.returnYears().toList();
                            return SizedBox(
                              width: 40.0,
                              height: 156.0,
                              child: CarouselSlider.builder(
                                itemCount: currentYear.length,
                                itemBuilder: (context, currentYearIndex, _) {
                                  final currentYearItem =
                                      currentYear[currentYearIndex];
                                  return Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      currentYearItem.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
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
                                            .indexOf(int.parse(dateTimeFormat(
                                                'yyyy', getCurrentTimestamp))),
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
                                    _model.carouselCurrentIndex3 = index;
                                    setState(() {
                                      _model.selectedDate =
                                          functions.returnSelectedDate(
                                              dateTimeFormat(
                                                  'd', _model.selectedDate),
                                              dateTimeFormat(
                                                  'M', _model.selectedDate),
                                              ((int var1, List<int> var2) {
                                                return var2[var1];
                                              }(
                                                      _model
                                                          .carouselCurrentIndex3,
                                                      functions
                                                          .returnYears()
                                                          .toList()))
                                                  .toString(),
                                              dateTimeFormat(
                                                  'HH', _model.selectedDate),
                                              dateTimeFormat(
                                                  'mm', _model.selectedDate));
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
              ),
              Builder(
                builder: (context) => Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 40.0),
                  child: wrapWithModel(
                    model: _model.pinkButtonModel,
                    updateCallback: () => setState(() {}),
                    child: PinkButtonWidget(
                      text: 'Ask for a date',
                      currentAction: () async {
                        unawaited(
                          () async {
                            _model.newDateRow = await DatesTable().insert({
                              'date_time':
                                  supaSerialize<DateTime>(_model.selectedDate),
                              'status': 'pending',
                              'wish': widget.selectedWishRow?.uuid,
                              'pair': FFAppState().pairID,
                            });
                          }(),
                        );
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
                        showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: const AlignmentDirectional(0.0, -1.0)
                                  .resolve(Directionality.of(context)),
                              child: const WebViewAware(
                                child: AlertDialogWarningWidget(
                                  title: 'Date created successfully !',
                                  subtitle: '',
                                ),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));

                        Navigator.pop(context);
                        context.safePop();

                        setState(() {});
                      },
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
