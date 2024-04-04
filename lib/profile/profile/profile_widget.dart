import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
    with TickerProviderStateMixin {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'stackOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'iconOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 2400.ms,
          begin: const Offset(4.0, 4.0),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Background.webp',
              ).image,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 47.0, 16.0, 0.0),
                child: SizedBox(
                  height: 38.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0x9A000000),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 4.0, 8.0, 0.0),
                            child: Text(
                              'Profile',
                              style: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Nuckle',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                    lineHeight: 1.4,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: Stack(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          children: [
                            Container(
                              width: 38.0,
                              height: 38.0,
                              decoration: BoxDecoration(
                                color: const Color(0x9A000000),
                                borderRadius: BorderRadius.circular(14.0),
                                border: Border.all(
                                  color: const Color(0x33FFFFFF),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              size: 16.0,
                            ),
                          ],
                        ),
                      ).animateOnPageLoad(
                          animationsMap['stackOnPageLoadAnimation']!),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 140.0,
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/images/viniet.webp',
                              width: double.infinity,
                              height: 100.0,
                              fit: BoxFit.contain,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: SizedBox(
                                        width: 100.0,
                                        height: 100.0,
                                        child: Stack(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 16.0,
                                                  sigmaY: 16.0,
                                                ),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0x1AFFFFFF),
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: const Color(0xFF182DEF),
                                                      width: 3.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                    'Invite_Partner');
                                              },
                                              child: Container(
                                                width: 36.0,
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x28FFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                              ),
                                            ),
                                            Image.asset(
                                              'assets/images/pluss.webp',
                                              width: 16.0,
                                              height: 16.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Partner',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        19.0, 43.0, 19.0, 0.0),
                                    child: const Icon(
                                      FFIcons.kshape,
                                      color: Color(0xFFFF2C96),
                                      size: 18.0,
                                    ).animateOnPageLoad(animationsMap[
                                        'iconOnPageLoadAnimation']!),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: SizedBox(
                                        width: 100.0,
                                        height: 100.0,
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/prof1.webp',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: const Color(0xFFFF2C96),
                                                  width: 3.0,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        100.0),
                                                child: BackdropFilter(
                                                  filter: ImageFilter.blur(
                                                    sigmaX: 16.0,
                                                    sigmaY: 16.0,
                                                  ),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'Edit_Profile');
                                                    },
                                                    child: Container(
                                                      width: 30.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0x1AFFFFFF),
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Icon(
                                                        Icons.edit,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        size: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Lola',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 46.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: const Color(0x0FFFFFFF),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x1AFFFFFF),
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 16.0,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Edit Couple Profile',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: const BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Edit_Couple_Profile');
                                    },
                                    child: Icon(
                                      Icons.navigate_next_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: const Color(0x0FFFFFFF),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x1AFFFFFF),
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 16.0,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Edit Profile',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: const BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Edit_Profile');
                                    },
                                    child: Icon(
                                      Icons.navigate_next_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'INSIGHTS',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 14.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: const Color(0x0FFFFFFF),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x1AFFFFFF),
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.solidBell,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 16.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Notifications',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: const BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Notify_Settings');
                                    },
                                    child: Icon(
                                      Icons.navigate_next_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: const Color(0x0FFFFFFF),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x1AFFFFFF),
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image.asset(
                                      'assets/images/language.webp',
                                      width: 16.0,
                                      height: 16.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Language',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: const BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Language');
                                    },
                                    child: Icon(
                                      Icons.navigate_next_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: const Color(0x0FFFFFFF),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x1AFFFFFF),
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Icon(
                                    Icons.mail,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 16.0,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Invite Partner',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: const BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Invite_Partner');
                                    },
                                    child: Icon(
                                      Icons.navigate_next_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: const Color(0x0FFFFFFF),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x1AFFFFFF),
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Icon(
                                    Icons.mail,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 16.0,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Change Password',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: const BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Invite_Partner');
                                    },
                                    child: Icon(
                                      Icons.navigate_next_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: const Color(0x0FFFFFFF),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x1AFFFFFF),
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Icon(
                                    Icons.mail,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 16.0,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Manage Subscriptions',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: const BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Invite_Partner');
                                    },
                                    child: Icon(
                                      Icons.navigate_next_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'INFLUENCERS & CREATORS',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Nuckle',
                                    color: FlutterFlowTheme.of(context).info,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: const Color(0x0FFFFFFF),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x1AFFFFFF),
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Icon(
                                    Icons.gpp_bad,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 16.0,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Privacy Policy',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: const BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Privacy_Policy');
                                    },
                                    child: Icon(
                                      Icons.navigate_next_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: const Color(0x0FFFFFFF),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x1AFFFFFF),
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Icon(
                                    Icons.feed,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 16.0,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Terms & Conditions',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: const BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Terms_Conditions');
                                    },
                                    child: Icon(
                                      Icons.navigate_next_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: const Color(0x0FFFFFFF),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x1AFFFFFF),
                                    borderRadius: BorderRadius.circular(11.0),
                                  ),
                                  child: Icon(
                                    Icons.feed,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 16.0,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Help',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Nuckle',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: const BoxDecoration(),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('Terms_Conditions');
                                    },
                                    child: Icon(
                                      Icons.navigate_next_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 34.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              context.goNamedAuth('Splash', context.mounted);
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      9.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Logout',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Nuckle',
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w300,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]
                        .addToStart(const SizedBox(height: 20.0))
                        .addToEnd(const SizedBox(height: 80.0)),
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
