import '/backend/supabase/supabase.dart';
import '/components/card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'wishes_list_main_model.dart';
export 'wishes_list_main_model.dart';

class WishesListMainWidget extends StatefulWidget {
  const WishesListMainWidget({
    super.key,
    required this.wishesRowsParam,
    bool? isMyProfile,
    double? endSpacing,
  })  : isMyProfile = isMyProfile ?? false,
        endSpacing = endSpacing ?? 0.0;

  final List<WishesRow>? wishesRowsParam;
  final bool isMyProfile;
  final double endSpacing;

  @override
  State<WishesListMainWidget> createState() => _WishesListMainWidgetState();
}

class _WishesListMainWidgetState extends State<WishesListMainWidget>
    with TickerProviderStateMixin {
  late WishesListMainModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WishesListMainModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('WISHES_LIST_MAIN_wishesListMain_ON_INIT_');
      if (widget.isMyProfile) {
        logFirebaseEvent('wishesListMain_backend_call');
        _model.reactionImagesRows = await ReactionImagesTable().queryRows(
          queryFn: (q) => q.order('rating', ascending: true),
        );
      }
      logFirebaseEvent('wishesListMain_update_app_state');

      setState(() {});
    });

    animationsMap.addAll({
      'gridViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
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
    context.watch<FFAppState>();

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
      child: Builder(
        builder: (context) {
          final currentWish = widget.wishesRowsParam!.toList();
          return GridView.builder(
            padding: EdgeInsets.fromLTRB(
              0,
              10.0,
              0,
              valueOrDefault<double>(
                widget.endSpacing,
                0.0,
              ),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.75,
            ),
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: currentWish.length,
            itemBuilder: (context, currentWishIndex) {
              final currentWishItem = currentWish[currentWishIndex];
              return CardWidget(
                key: Key('Keyxvr_${currentWishIndex}_of_${currentWish.length}'),
                isMyProfile: widget.isMyProfile,
                currentWishRow: currentWishItem,
                reactionImagesRows: _model.reactionImagesRows,
              );
            },
          ).animateOnPageLoad(animationsMap['gridViewOnPageLoadAnimation']!);
        },
      ),
    );
  }
}
