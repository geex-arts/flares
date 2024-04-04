import '/flutter_flow/flutter_flow_util.dart';
import 'notify_settings_widget.dart' show NotifySettingsWidget;
import 'package:flutter/material.dart';

class NotifySettingsModel extends FlutterFlowModel<NotifySettingsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DateinvItationsSwitch widget.
  bool? dateinvItationsSwitchValue;
  // State field(s) for ReactionsSwitch widget.
  bool? reactionsSwitchValue;
  // State field(s) for AddedNewWishSwitch widget.
  bool? addedNewWishSwitchValue;
  // State field(s) for PushRecommendationsSwitch widget.
  bool? pushRecommendationsSwitchValue;
  // State field(s) for PartnerActivitySwitch widget.
  bool? partnerActivitySwitchValue;
  // State field(s) for DailyConversationsSwitch widget.
  bool? dailyConversationsSwitchValue;
  // State field(s) for StreakRemindersSwitch widget.
  bool? streakRemindersSwitchValue;
  // State field(s) for RecommendationsSwitch widget.
  bool? recommendationsSwitchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
