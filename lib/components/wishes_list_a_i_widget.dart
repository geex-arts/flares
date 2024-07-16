import '/backend/schema/structs/index.dart';
import '/components/card_a_i_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'wishes_list_a_i_model.dart';
export 'wishes_list_a_i_model.dart';

class WishesListAIWidget extends StatefulWidget {
  const WishesListAIWidget({
    super.key,
    required this.wishesRowsAI,
  });

  final List<AiWishStruct>? wishesRowsAI;

  @override
  State<WishesListAIWidget> createState() => _WishesListAIWidgetState();
}

class _WishesListAIWidgetState extends State<WishesListAIWidget>
    with TickerProviderStateMixin {
  late WishesListAIModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WishesListAIModel());

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
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
      child: Builder(
        builder: (context) {
          final currentWish = widget.wishesRowsAI!.toList();

          return GridView.builder(
            padding: const EdgeInsets.fromLTRB(
              0,
              10.0,
              0,
              120.0,
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
              return CardAIWidget(
                key: Key('Keyy39_${currentWishIndex}_of_${currentWish.length}'),
                wishAIElement: currentWishItem,
              );
            },
          ).animateOnPageLoad(animationsMap['gridViewOnPageLoadAnimation']!);
        },
      ),
    );
  }
}
