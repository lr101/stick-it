import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/repository/image_repository.dart';
import 'package:buff_lisa/data/repository/member_repository.dart';
import 'package:buff_lisa/data/repository/pin_repository.dart';
import 'package:buff_lisa/data/repository/user_pins_repository.dart';
import 'package:buff_lisa/data/repository/user_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/shared_preferences_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogoutScreen extends ConsumerStatefulWidget {
  const LogoutScreen({super.key});

  @override
  ConsumerState<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends ConsumerState<LogoutScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logout();
    });
  }

  Future<void> _logout() async {
    // 1. Safely read all repositories and dependencies BEFORE any async gap
    final pinImageRepo = ref.read(pinImageRepositoryProvider);
    final groupRepo = ref.read(groupRepositoryProvider);
    final groupProfileRepo = ref.read(groupProfileRepoProvider);
    final groupProfileSmallRepo = ref.read(groupProfileSmallRepoProvider);
    final groupPinImageRepo = ref.read(groupPinImageRepoProvider);
    final memberRepo = ref.read(memberRepositoryProvider);
    final pinRepo = ref.read(pinRepositoryProvider);
    final userImageRepo = ref.read(userImageRepoProvider);
    final userImageSmallRepo = ref.read(userImageSmallRepoProvider);
    final userLikeRepo = ref.read(userLikeRepositoryProvider);
    final userRepo = ref.read(userRepositoryProvider);
    final userPinsRepo = ref.read(userPinsRepositoryProvider);
    final sharedPreferences = ref.read(sharedPreferencesProvider);

    // 2. Clear all repositories
    await Future.wait([
      pinImageRepo.deleteAll(),
      groupRepo.deleteAll(),
      groupProfileRepo.deleteAll(),
      groupProfileSmallRepo.deleteAll(),
      groupPinImageRepo.deleteAll(),
      memberRepo.deleteAll(),
      pinRepo.deleteAll(),
      userImageRepo.deleteAll(),
      userImageSmallRepo.deleteAll(),
      userLikeRepo.deleteAll(),
      userRepo.deleteAll(),
      userPinsRepo.deleteAll(),
    ]);

    // 3. Clear remaining external caches
    if (!kIsWeb) {
      final mgmt = const FMTCStore('tileStore').manage;
      await mgmt.reset();
    }

    await sharedPreferences.clear();
    await DefaultCacheManager().emptyCache();

    // 4. Invalidate the syncing service last (it depends on userId)
    ref.invalidate(lastSeenProvider);
    
    // 5. Finally, logout in GlobalDataService
    await ref.read(globalDataServiceProvider.notifier).logout();

    if (!mounted) return;
    context.goNamed("login");
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 15),
            Text(
              "Logging out... Please wait.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
