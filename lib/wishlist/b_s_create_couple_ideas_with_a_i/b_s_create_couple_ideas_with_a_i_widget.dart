import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/wishlist/b_s_budget_location/b_s_budget_location_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'b_s_create_couple_ideas_with_a_i_model.dart';
export 'b_s_create_couple_ideas_with_a_i_model.dart';

class BSCreateCoupleIdeasWithAIWidget extends StatefulWidget {
  const BSCreateCoupleIdeasWithAIWidget({super.key});

  @override
  State<BSCreateCoupleIdeasWithAIWidget> createState() =>
      _BSCreateCoupleIdeasWithAIWidgetState();
}

class _BSCreateCoupleIdeasWithAIWidgetState
    extends State<BSCreateCoupleIdeasWithAIWidget> {
  late BSCreateCoupleIdeasWithAIModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSCreateCoupleIdeasWithAIModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 12.0),
                child: Text(
                  'Create couple ideas with AI',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Nuckle',
                        color: FlutterFlowTheme.of(context).info,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              const Divider(
                thickness: 1.0,
                color: Color(0x0CF2F1F3),
              ),
              FutureBuilder<List<CollectionsRow>>(
                future: CollectionsTable().queryRows(
                  queryFn: (q) => q.eq(
                    'visibility',
                    true,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitPulse(
                          color: FlutterFlowTheme.of(context).pinkButton,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<CollectionsRow> containerCollectionsRowList =
                      snapshot.data!;
                  return Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final currentCategory = functions
                              .uniqueListElements(containerCollectionsRowList
                                  .map((e) => e.lowercaseName)
                                  .withoutNulls
                                  .toList())
                              .toList();
                          return Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: List.generate(currentCategory.length,
                                (currentCategoryIndex) {
                              final currentCategoryItem =
                                  currentCategory[currentCategoryIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'B_S_CREATE_COUPLE_IDEAS_WITH_A_I_Contain');
                                  if (_model.selectedCategoriesNames
                                      .contains(currentCategoryItem)) {
                                    logFirebaseEvent(
                                        'Container_update_component_state');
                                    setState(() {
                                      _model.removeFromSelectedCategoriesNames(
                                          currentCategoryItem);
                                    });
                                  } else {
                                    logFirebaseEvent(
                                        'Container_update_component_state');
                                    setState(() {
                                      _model.addToSelectedCategoriesNames(
                                          currentCategoryItem);
                                    });
                                  }
                                },
                                child: Container(
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    color: _model.selectedCategoriesNames
                                            .contains(currentCategoryItem)
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : const Color(0x0DFFFFFF),
                                    borderRadius: BorderRadius.circular(100.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (containerCollectionsRowList
                                                  .where((e) =>
                                                      e.lowercaseName ==
                                                      currentCategoryItem)
                                                  .toList()
                                                  .first
                                                  .photo !=
                                              null &&
                                          containerCollectionsRowList
                                                  .where((e) =>
                                                      e.lowercaseName ==
                                                      currentCategoryItem)
                                                  .toList()
                                                  .first
                                                  .photo !=
                                              '')
                                        Container(
                                          width: 39.0,
                                          height: 39.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            containerCollectionsRowList
                                                .where((e) =>
                                                    e.lowercaseName ==
                                                    currentCategoryItem)
                                                .toList()
                                                .first
                                                .photo!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 2.0, 12.0, 0.0),
                                        child: Text(
                                          functions.capitalizeFirstLetter(
                                              currentCategoryItem),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Nuckle',
                                                color: _model
                                                        .selectedCategoriesNames
                                                        .contains(
                                                            currentCategoryItem)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ].addToStart(const SizedBox(width: 3.0)),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 16.0, 45.0),
                child: wrapWithModel(
                  model: _model.generateModel,
                  updateCallback: () => setState(() {}),
                  child: PinkButtonWidget(
                    text: '⚡️ Generate with AI',
                    currentAction: () async {
                      logFirebaseEvent(
                          'B_S_CREATE_COUPLE_IDEAS_WITH_A_I_Generat');
                      logFirebaseEvent('Generate_bottom_sheet');
                      Navigator.pop(context);
                      if (_model.selectedCategoriesNames.isNotEmpty) {
                        logFirebaseEvent('Generate_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: BSBudgetLocationWidget(
                                  selectedCategories: (List<String> var1) {
                                    return var1.join(', ');
                                  }(_model.selectedCategoriesNames.toList()),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      } else {
                        logFirebaseEvent('Generate_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: const BSBudgetLocationWidget(
                                  selectedCategories: 'any',
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      }
                    },
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
