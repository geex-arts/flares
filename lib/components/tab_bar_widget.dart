import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'tab_bar_model.dart';
export 'tab_bar_model.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  late TabBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TabBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 16.0,
              sigmaY: 16.0,
            ),
            child: Container(
              width: 200.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color(0x1AFFFFFF),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('Explore');
                      },
                      child: Container(
                        width: 44.0,
                        height: 44.0,
                        decoration: const BoxDecoration(),
                        child: Icon(
                          FFIcons.kworld,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 18.0,
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('Category_P2');
                      },
                      child: Container(
                        width: 44.0,
                        height: 44.0,
                        decoration: const BoxDecoration(),
                        child: Icon(
                          FFIcons.kgroup63448861,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          size: 22.0,
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('My_Profile');
                      },
                      child: Container(
                        width: 44.0,
                        height: 44.0,
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 22.0,
                            height: 22.0,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/images/prof3.webp',
                              fit: BoxFit.cover,
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
        ),
      ),
    );
  }
}
