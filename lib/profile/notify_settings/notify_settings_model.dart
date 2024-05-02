import '/flutter_flow/flutter_flow_util.dart';
import 'notify_settings_widget.dart' show NotifySettingsWidget;
import 'package:flutter/material.dart';

class NotifySettingsModel extends FlutterFlowModel<NotifySettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DateinvItationsSwitch widget.
  bool dateinvItationsSwitchValue = false;
  // State field(s) for ReactionsSwitch widget.
  bool reactionsSwitchValue = false;
  // State field(s) for AddedNewWishSwitch widget.
  bool addedNewWishSwitchValue = false;
  // State field(s) for PushRecommendationsSwitch widget.
  bool pushRecommendationsSwitchValue = false;
  // State field(s) for PartnerActivitySwitch widget.
  bool partnerActivitySwitchValue = false;
  // State field(s) for DailyConversationsSwitch widget.
  bool dailyConversationsSwitchValue = false;
  // State field(s) for StreakRemindersSwitch widget.
  bool streakRemindersSwitchValue = false;
  // State field(s) for RecommendationsSwitch widget.
  bool recommendationsSwitchValue = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
