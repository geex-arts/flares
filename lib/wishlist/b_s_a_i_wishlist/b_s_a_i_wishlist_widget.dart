import '/backend/supabase/supabase.dart';
import '/components/pink_button_widget.dart';
import '/components/wishes_list_main_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'b_s_a_i_wishlist_model.dart';
export 'b_s_a_i_wishlist_model.dart';

class BSAIWishlistWidget extends StatefulWidget {
  const BSAIWishlistWidget({super.key});

  @override
  State<BSAIWishlistWidget> createState() => _BSAIWishlistWidgetState();
}

class _BSAIWishlistWidgetState extends State<BSAIWishlistWidget> {
  late BSAIWishlistModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BSAIWishlistModel());
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
                  FutureBuilder<List<WishesRow>>(
                    future: WishesTable().queryRows(
                      queryFn: (q) => q.order('created_at'),
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
                      List<WishesRow> wishesListMainWishesRowList =
                          snapshot.data!;
                      return wrapWithModel(
                        model: _model.wishesListMainModel,
                        updateCallback: () => setState(() {}),
                        child: WishesListMainWidget(
                          isMyProfile: false,
                          wishesRowsParam: wishesListMainWishesRowList,
                          endSpacing: 120.0,
                        ),
                      );
                    },
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 30.0, 16.0, 45.0),
                  child: wrapWithModel(
                    model: _model.generateModel,
                    updateCallback: () => setState(() {}),
                    child: PinkButtonWidget(
                      text: 'Generate more',
                      currentAction: () async {
                        Navigator.pop(context);
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
