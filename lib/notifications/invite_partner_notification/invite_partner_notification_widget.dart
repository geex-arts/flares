import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'invite_partner_notification_model.dart';
export 'invite_partner_notification_model.dart';

class InvitePartnerNotificationWidget extends StatefulWidget {
  const InvitePartnerNotificationWidget({super.key});

  @override
  State<InvitePartnerNotificationWidget> createState() =>
      _InvitePartnerNotificationWidgetState();
}

class _InvitePartnerNotificationWidgetState
    extends State<InvitePartnerNotificationWidget> {
  late InvitePartnerNotificationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InvitePartnerNotificationModel());
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
        ),
      ),
    );
  }
}
