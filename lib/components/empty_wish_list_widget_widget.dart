import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/wishlist/b_s_add_wishes/b_s_add_wishes_widget.dart';
import 'package:flutter/material.dart';
import 'empty_wish_list_widget_model.dart';
export 'empty_wish_list_widget_model.dart';

class EmptyWishListWidgetWidget extends StatefulWidget {
  const EmptyWishListWidgetWidget({super.key});

  @override
  State<EmptyWishListWidgetWidget> createState() =>
      _EmptyWishListWidgetWidgetState();
}

class _EmptyWishListWidgetWidgetState extends State<EmptyWishListWidgetWidget> {
  late EmptyWishListWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyWishListWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Add or import\nyour first Wish',
          style: FlutterFlowTheme.of(context).titleMedium.override(
                fontFamily: 'Nuckle',
                color: FlutterFlowTheme.of(context).info,
                fontSize: 20.0,
                letterSpacing: 0.0,
                useGoogleFonts: false,
                lineHeight: 1.3,
              ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: FFButtonWidget(
            onPressed: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: const BSAddWishesWidget(),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            text: 'How it works',
            options: FFButtonOptions(
              width: 155.0,
              height: 42.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).pinkButton,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Nuckle',
                    color: Colors.white,
                    fontSize: 17.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    useGoogleFonts: false,
                  ),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ],
    );
  }
}
