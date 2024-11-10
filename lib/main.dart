import 'dart:async';
import 'dart:io';
import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/features/auth/presentation/auth.dart';
import 'package:buff_lisa/features/auth/presentation/loading.dart';
import 'package:buff_lisa/util/theme/data/material_theme.dart';
import 'package:buff_lisa/util/theme/service/theme_state.dart';
import 'package:buff_lisa/widgets/custom_marker/data/default_group_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'data/service/shared_preferences_service.dart';
import 'features/navigation/data/navigation_provider.dart';

/// THIS IS THE START OF THE PROGRAMM
/// binding Widgets before initialization is required by multiple packages
/// initializes access to env variables
/// checks if user is logged in on this device by checking device storage
///
///
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  try {
    await FMTCObjectBoxBackend().initialise();
    final mgmt = FMTCStore('tileStore').manage;
    final ready = await mgmt.ready; // Check whether the store exists
    if (!ready) await mgmt.create(); // Create the store
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
  final storage = await FlutterSecureStorage();
  final globalData = await GlobalDataRepository.get(sharedPreferences, storage);
  final defaultGroupImage =  (await rootBundle.load('assets/image/pin_border.png')).buffer.asUint8List();
  final defaultErrorImage =  (await rootBundle.load('assets/image/profile.jpg')).buffer.asUint8List();
  await dotenv.load();
  runApp(
    ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          flutterSecureStorageProvider.overrideWithValue(storage),
          globalDataOnceProvider.overrideWithValue(globalData),
          defaultGroupPinImageProvider.overrideWithValue(defaultGroupImage),
          defaultErrorImageProvider.overrideWithValue(defaultErrorImage),
        ],
        child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {

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
      theme: theme.lightHighContrast(),
      initialRoute: ref.watch(globalDataServiceProvider).userId != null ? '/home' : '/login',
      routes: {
        '/login': (context) => Auth(),
        '/home': (context) {
          return const Loading();
        }
      },
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}

