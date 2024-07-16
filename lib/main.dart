import '/custom_code/actions/index.dart' as actions;
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'dart:io' show Platform;

import 'auth/supabase_auth/supabase_user_provider.dart';
import 'auth/supabase_auth/auth_util.dart';

import '/backend/supabase/supabase.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import 'flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter_sharing_intent/flutter_sharing_intent.dart';
import 'package:flutter_sharing_intent/model/sharing_file.dart';
import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';
import 'package:flutter_sharing_intent/flutter_sharing_intent.dart';
import 'package:flutter_sharing_intent/model/sharing_file.dart';
import '/backend/firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:customer_io/customer_io.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await initFirebase();
  CustomerIO.messagingPush().onBackgroundMessageReceived(message.toMap()).then((handled) {
    // handled is true if notification was handled by Customer.io SDK; false otherwise
    return handled;
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();
  await initFirebase();

  await SupaFlow.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  await revenue_cat.initialize(
    "appl_WJnHYADaLdtnuWqutpGMesBDKiH",
    "goog_YwrPlXjJHzkEKJPJGsDIWrubbCP",
    debugLogEnabled: true,
    loadDataAfterLaunch: true,
  );

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true, // Required to display a heads up notification
    badge: true,
    sound: true,
  );

  const AndroidNotificationChannel channel = AndroidNotificationChannel('my_app_channel', 'my_app_channel',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    showBadge: true,
    enableVibration: true,
    playSound: true
  );

  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  notificationsPlugin.initialize(
    InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ),
  );

  await notificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  var android = const AndroidNotificationDetails(
    'my_app_channel',
    'my_app_channel',
    channelDescription: 'channel description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      CustomerIO.messagingPush().onMessageReceived(message.toMap()).then((handled) {
        // handled is true if notification was handled by Customer.io SDK; false otherwise
        return handled;
      });
  });

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  late StreamSubscription _intentDataStreamSubscription;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  late Stream<BaseAuthUser> userStream;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = flaresSupabaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});


    //Shared: getInitialMedia https://www.instagram.com/p/C5D8JKCNkOZ/?igsh=MTBoZ2M4N3RscmZwbw==
    //should open Create_wish screen with url props
    _intentDataStreamSubscription = FlutterSharingIntent.instance.getMediaStream()
        .listen((List<SharedFile> value) {

      //get url from query param
      final urlToParse = value.map((f) => f.value).join(",");
      //https://flaresapp.page.link/myProfileCopy/?url='https://zodiacmoscow.ru/

      final url = value.map((f) => f.value).join(",");

      if (url.isNotEmpty) {
        _router.go('/addFromBrowser?url=${Uri.encodeComponent(url)}');
      }

    }, onError: (err) {
      print("getIntentDataStream error: $err");
    });

    // For sharing images coming from outside the app while the app is closed
    FlutterSharingIntent.instance.getInitialSharing().then((List<SharedFile> value) {
      print("Shared: getInitialMedia ${value.map((f) => f.value).join(",")}");

      //get url from query param
      final urlToParse = value.map((f) => f.value).join(",");
      //https://flaresapp.page.link/myProfileCopy/?url='https://zodiacmoscow.ru/

      final url = value.map((f) => f.value).join(",");

      if (url.isNotEmpty) {
        _router.go('/addFromBrowser?url=${Uri.encodeComponent(url)}');
      }
    });

    Future.delayed(
      Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flares',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(
          thickness: WidgetStateProperty.all(0.1),
        ),
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
      builder: (_, child) => DynamicLinksHandler(
        router: _router,
        child: child!,
      ),
    );
  }
}
