import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.loggedIn ? const MyProfileWidget() : const SplashWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const MyProfileWidget() : const SplashWidget(),
          routes: [
            FFRoute(
              name: 'My_Profile',
              path: 'myProfile',
              requireAuth: true,
              builder: (context, params) => MyProfileWidget(
                url: params.getParam(
                  'url',
                  ParamType.String,
                ),
                pairCode: params.getParam(
                  'pairCode',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Splash',
              path: 'splash',
              builder: (context, params) => SplashWidget(
                pairCode: params.getParam(
                  'pairCode',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Onboarding',
              path: 'onboarding',
              builder: (context, params) => OnboardingWidget(
                pairCode: params.getParam(
                  'pairCode',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Sign_In',
              path: 'signIn',
              builder: (context, params) => SignInWidget(
                pairCode: params.getParam(
                  'pairCode',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Sign_Up',
              path: 'signUp',
              builder: (context, params) => SignUpWidget(
                pairCode: params.getParam(
                  'pairCode',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Reset_Password',
              path: 'resetPassword',
              builder: (context, params) => const ResetPasswordWidget(),
            ),
            FFRoute(
              name: 'New_Password',
              path: 'newPass',
              builder: (context, params) => const NewPasswordWidget(),
            ),
            FFRoute(
              name: 'Notifications',
              path: 'notifications',
              builder: (context, params) => const NotificationsWidget(),
            ),
            FFRoute(
              name: 'Terms_Conditions',
              path: 'termsConditions',
              builder: (context, params) => const TermsConditionsWidget(),
            ),
            FFRoute(
              name: 'Privacy_Policy',
              path: 'privacyPolicy',
              builder: (context, params) => const PrivacyPolicyWidget(),
            ),
            FFRoute(
              name: 'Invite_Partner_Onb',
              path: 'invitePartnerOnb',
              builder: (context, params) => InvitePartnerOnbWidget(
                pairInvitationRow: params.getParam<PairsInvitationsRow>(
                  'pairInvitationRow',
                  ParamType.SupabaseRow,
                ),
                isFromProfile: params.getParam(
                  'isFromProfile',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'Language',
              path: 'language',
              builder: (context, params) => const LanguageWidget(),
            ),
            FFRoute(
              name: 'Edit_Couple_Profile',
              path: 'editCoupleProfile',
              builder: (context, params) => EditCoupleProfileWidget(
                myPairRow: params.getParam<PairsRow>(
                  'myPairRow',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: 'Notify_Settings',
              path: 'notifySettings',
              builder: (context, params) => NotifySettingsWidget(
                userRow: params.getParam<UsersRow>(
                  'userRow',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: 'Couples_Profile',
              path: 'couplesProfile',
              builder: (context, params) => CouplesProfileWidget(
                selectedPairID: params.getParam(
                  'selectedPairID',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Category_P2',
              path: 'categoryP2',
              builder: (context, params) => CategoryP2Widget(
                popularWishes: params.getParam<PopularWishesRow>(
                  'popularWishes',
                  ParamType.SupabaseRow,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: 'Add_Wish_Reaction',
              path: 'addWishReaction',
              builder: (context, params) => AddWishReactionWidget(
                selectedWishRow: params.getParam<WishesRow>(
                  'selectedWishRow',
                  ParamType.SupabaseRow,
                ),
                selectedWishReaction: params.getParam<WishReactionsRow>(
                  'selectedWishReaction',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: 'Wish_Main',
              path: 'wishMain',
              builder: (context, params) => WishMainWidget(
                isProfile: params.getParam(
                  'isProfile',
                  ParamType.bool,
                ),
                isFromAI: params.getParam(
                  'isFromAI',
                  ParamType.bool,
                ),
                selectedWishID: params.getParam(
                  'selectedWishID',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Profile',
              path: 'profile',
              builder: (context, params) => const ProfileWidget(),
            ),
            FFRoute(
              name: 'Edit_Profile',
              path: 'editProfile',
              builder: (context, params) => const EditProfileWidget(),
            ),
            FFRoute(
              name: 'Create_Couple_Profile',
              path: 'createCoupleProfile',
              builder: (context, params) => const CreateCoupleProfileWidget(),
            ),
            FFRoute(
              name: 'More',
              path: 'more',
              builder: (context, params) => const MoreWidget(),
            ),
            FFRoute(
              name: 'Subscriptions',
              path: 'subscriptions',
              builder: (context, params) => SubscriptionsWidget(
                isFIrstTime: params.getParam(
                  'isFIrstTime',
                  ParamType.bool,
                ),
              ),
            ),
            FFRoute(
              name: 'Invite_Partner',
              path: 'invitePartner',
              builder: (context, params) => const InvitePartnerWidget(),
            ),
            FFRoute(
              name: 'Category_P',
              path: 'categoryP',
              builder: (context, params) => CategoryPWidget(
                selectedCategory: params.getParam<DiscoveryCategoriesRow>(
                  'selectedCategory',
                  ParamType.SupabaseRow,
                ),
              ),
            ),
            FFRoute(
              name: 'Explore',
              path: 'explore',
              requireAuth: true,
              builder: (context, params) => const ExploreWidget(),
            ),
            FFRoute(
              name: 'addFromBrowser',
              path: 'addFromBrowser',
              builder: (context, params) => AddFromBrowserWidget(
                url: params.getParam(
                  'url',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Official_Referral',
              path: 'officialReferral',
              builder: (context, params) => const OfficialReferralWidget(),
            ),
            FFRoute(
              name: 'Stories_View',
              path: 'storiesView',
              builder: (context, params) => StoriesViewWidget(
                selectedStories: params.getParam<StoriesRow>(
                  'selectedStories',
                  ParamType.SupabaseRow,
                ),
                selectedArticle: params.getParam<ArticlesRow>(
                  'selectedArticle',
                  ParamType.SupabaseRow,
                ),
                aiAssistantLink: params.getParam(
                  'aiAssistantLink',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Assistant_View',
              path: 'assistantView',
              builder: (context, params) => AssistantViewWidget(
                aiAssistantLink: params.getParam(
                  'aiAssistantLink',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Privacy_PolicyCopy',
              path: 'privacyPolicyCopy',
              builder: (context, params) => const PrivacyPolicyCopyWidget(),
            ),
            FFRoute(
              name: 'Terms_ConditionsCopy',
              path: 'termsConditionsCopy',
              builder: (context, params) => const TermsConditionsCopyWidget(),
            ),
            FFRoute(
              name: 'Past_Dates',
              path: 'pastDates',
              builder: (context, params) => PastDatesWidget(
                pastDatesWishes: params.getParam<String>(
                  'pastDatesWishes',
                  ParamType.String,
                  isList: true,
                ),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splash';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitPulse(
                      color: FlutterFlowTheme.of(context).pinkButton,
                      size: 50.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    required this.state,
    required this.child,
  });

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.uri.toString().startsWith('/link') &&
        widget.state.uri.toString().contains('request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
