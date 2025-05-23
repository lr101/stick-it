import 'dart:async';
import 'dart:io';

import 'package:buff_lisa/data/entity/group_entity.dart';
import 'package:buff_lisa/data/entity/image_entity.dart';
import 'package:buff_lisa/data/entity/member_entity.dart';
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:buff_lisa/data/entity/pin_like_entity.dart';
import 'package:buff_lisa/data/entity/season_entity.dart';
import 'package:buff_lisa/data/entity/user_entity.dart';
import 'package:buff_lisa/data/entity/user_like_entity.dart';
import 'package:buff_lisa/data/entity/user_pins_entity.dart';
import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/shared_preferences_service.dart';
import 'package:buff_lisa/features/auth/presentation/auth.dart';
import 'package:buff_lisa/features/navigation/data/navigation_provider.dart';
import 'package:buff_lisa/features/navigation/presentation/navigation.dart';
import 'package:buff_lisa/firebase_options.dart';
import 'package:buff_lisa/util/core/cache_migrator.dart';
import 'package:buff_lisa/util/theme/data/material_theme.dart';
import 'package:buff_lisa/util/theme/service/theme_state.dart';
import 'package:buff_lisa/widgets/custom_marker/data/default_group_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// THIS IS THE START OF THE PROGRAMM
/// binding Widgets before initialization is required by multiple packages
/// initializes access to env variables
/// checks if user is logged in on this device by checking device storage
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(GroupEntityAdapter());
  Hive.registerAdapter(ImageEntityAdapter());
  Hive.registerAdapter(MembersEntityAdapter());
  Hive.registerAdapter(MemberEntityAdapter());
  Hive.registerAdapter(PinEntityAdapter());
  Hive.registerAdapter(UserEntityAdapter());
  Hive.registerAdapter(UserLikeEntityAdapter());
  Hive.registerAdapter(PinLikeEntityAdapter());
  Hive.registerAdapter(UserPinsEntityAdapter());
  Hive.registerAdapter(SeasonEntityAdapter());
  final migrator = CacheMigrator(prefs: sharedPreferences, latestVersion: 1);
  await migrator.migrate();
  const bool isProduction = bool.fromEnvironment('dart.vm.product');
  if (isProduction) {
    await dotenv.load();
  } else {
    await dotenv.load(fileName: ".env.dev");
  }
  try {
    await FMTCObjectBoxBackend().initialise();
    final mgmt = const FMTCStore('tileStore').manage;
    final ready = await mgmt.ready; // Check whether the store exists
    if (!ready) await mgmt.create(maxLength: 2000); // Create the store
  } catch (e) {
    final dir = Directory(
      path.join(
        (await getApplicationDocumentsDirectory()).absolute.path,
        'fmtc',
      ),
    );
    await dir.delete(recursive: true);
    await FMTCObjectBoxBackend().initialise();
  }
  const storage = FlutterSecureStorage();
  final globalData = await GlobalDataRepository.get(sharedPreferences, storage);
  final globalUserData = await GlobalDataRepository.getUser(sharedPreferences, storage);
  final defaultGroupImage =  (await rootBundle.load('assets/image/pin_border.png')).buffer.asUint8List();
  final defaultErrorImage =  (await rootBundle.load('assets/image/profile_blank.jpg')).buffer.asUint8List();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);

  Posthog().screen(screenName: "main");

  runApp(
    ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          flutterSecureStorageProvider.overrideWithValue(storage),
          globalDataOnceProvider.overrideWithValue(globalData),
          currentUserOnceProvider.overrideWithValue(globalUserData),
          defaultGroupPinImageProvider.overrideWithValue(defaultGroupImage),
          defaultErrorImageProvider.overrideWithValue(defaultErrorImage),
        ],
        child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// App orientation can only be portrait mode (no landscape)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    final theme = MaterialTheme(Theme.of(context).textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mona App',
      themeMode: ref.watch(themeStateProvider),
      darkTheme: theme.dark(),
      theme: theme.light(),
      initialRoute: ref.watch(globalDataServiceProvider).userId != null ? '/home' : '/login',
      routes: {
        '/login': (context) => const Auth(),
        '/home': (context) {
          return const Navigation();
        },
      },
      navigatorKey: navigatorKey,
    );
  }
}
