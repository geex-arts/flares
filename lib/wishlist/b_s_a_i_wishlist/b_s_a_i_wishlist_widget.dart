import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/alert_dialog_warning_widget.dart';
import '/components/pink_button_widget.dart';
import '/components/wishes_list_a_i_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'b_s_a_i_wishlist_model.dart';
export 'b_s_a_i_wishlist_model.dart';

class BSAIWishlistWidget extends StatefulWidget {
  const BSAIWishlistWidget({
    super.key,
    required this.categories,
    required this.city,
    required this.budget,
  });

  final String? categories;
  final String? city;
  final String? budget;

  @override
  State<BSAIWishlistWidget> createState() => _BSAIWishlistWidgetState();
}

class _BSAIWishlistWidgetState extends State<BSAIWishlistWidget>
    with TickerProviderStateMixin {
  late BSAIWishlistModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSAIWishlistModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('B_S_A_I_WISHLIST_BS_AI_Wishlist_ON_INIT_');
      logFirebaseEvent('BS_AI_Wishlist_update_component_state');
      setState(() {
        _model.isLoading = true;
      });
      logFirebaseEvent('BS_AI_Wishlist_backend_call');
      _model.apiResultohpCopy = await GenerateAiWishCall.call(
        city: widget.city,
        budget: widget.budget,
        interest: widget.categories,
      );
      if ((_model.apiResultohpCopy?.succeeded ?? true)) {
        logFirebaseEvent('BS_AI_Wishlist_update_component_state');
        setState(() {
          _model.wishesAIGeneratedList = functions
              .jsonArrayToDataType(getJsonField(
                (_model.apiResultohpCopy?.jsonBody ?? ''),
                r'''$.*''',
                true,
              )!)
              .toList()
              .cast<AiWishStruct>();
          _model.isLoading = false;
        });
      } else {
        logFirebaseEvent('BS_AI_Wishlist_alert_dialog');
        await showDialog(
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
                  title: 'Something went wrong',
                  subtitle: 'Please try again later',
                ),
              ),
            );
          },
        ).then((value) => setState(() {}));
      }
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => ClipRRect(
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
            height: MediaQuery.sizeOf(context).height * 0.85,
            decoration: const BoxDecoration(
              color: Color(0x18F2F1F3),
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
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Container(
                        width: 33.0,
                        height: 4.0,
                        decoration: const BoxDecoration(
                          color: Color(0x3AF2F1F3),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 12.0),
                      child: Text(
                        'Wishlist',
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
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                    ))
                      const Divider(
                        thickness: 1.0,
                        color: Color(0x0CF2F1F3),
                      ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          if (!_model.isLoading) {
                            return wrapWithModel(
                              model: _model.wishesListAIModel,
                              updateCallback: () => setState(() {}),
                              child: WishesListAIWidget(
                                wishesRowsAI: _model.wishesAIGeneratedList,
                              ),
                            );
                          } else {
                            return Align(
                              alignment: const AlignmentDirectional(0.0, -0.3),
                              child: Image.asset(
                                'assets/images/logo.webp',
                                width: 155.0,
                                height: 157.0,
                                fit: BoxFit.cover,
                              ).animateOnPageLoad(
                                  animationsMap['imageOnPageLoadAnimation']!),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                if (!_model.isLoading)
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Builder(
                      builder: (context) => Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 30.0, 16.0, 45.0),
                        child: wrapWithModel(
                          model: _model.generateModel,
                          updateCallback: () => setState(() {}),
                          child: PinkButtonWidget(
                            text: 'Generate more',
                            currentAction: () async {
                              logFirebaseEvent(
                                  'B_S_A_I_WISHLIST_COMP_Generate_CALLBACK');
                              logFirebaseEvent(
                                  'Generate_update_component_state');
                              setState(() {
                                _model.isLoading = true;
                              });
                              logFirebaseEvent('Generate_backend_call');
                              _model.apiResultohp =
                                  await GenerateAiWishCall.call(
                                city: widget.city,
                                budget: widget.budget,
                                interest: widget.categories,
                              );
                              if ((_model.apiResultohp?.succeeded ?? true)) {
                                logFirebaseEvent(
                                    'Generate_update_component_state');
                                _model.wishesAIGeneratedList = functions
                                    .mergeTwoListsAIWishes(
                                        _model.wishesAIGeneratedList.toList(),
                                        functions
                                            .jsonArrayToDataType(getJsonField(
                                              (_model.apiResultohp?.jsonBody ??
                                                  ''),
                                              r'''$.*''',
                                              true,
                                            )!)
                                            .toList())
                                    .toList()
                                    .cast<AiWishStruct>();
                              } else {
                                logFirebaseEvent('Generate_alert_dialog');
                                await showDialog(
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
                                          title: 'Something went wrong',
                                          subtitle: 'Please try again later',
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              }

                              logFirebaseEvent(
                                  'Generate_update_component_state');
                              setState(() {
                                _model.isLoading = false;
                              });

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
      ),
    );
  }
}
