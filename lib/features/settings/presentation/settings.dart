import 'package:buff_lisa/data/repository/group_repository.dart';
import 'package:buff_lisa/data/repository/image_repository.dart';
import 'package:buff_lisa/data/repository/member_repository.dart';
import 'package:buff_lisa/data/repository/pin_repository.dart';
import 'package:buff_lisa/data/repository/user_pins_repository.dart';
import 'package:buff_lisa/data/repository/user_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/shared_preferences_service.dart';
import 'package:buff_lisa/data/service/syncing_service.dart';
import 'package:buff_lisa/features/navigation/data/navigation_provider.dart';
import 'package:buff_lisa/features/settings/presentation/state/notification_state.dart';
import 'package:buff_lisa/util/routing/routing.dart';
import 'package:buff_lisa/util/theme/service/theme_state.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:social_media_buttons/social_media_button.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  @override
  Widget build(BuildContext context) {
    final notificationState = ref.watch(notificationStateProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              title: const Text('App Settings'),
              tiles: [
                SettingsTile.navigation(
                  leading: const Icon(Icons.language),
                  title: const Text('Language'),
                  value: const Text('English'),
                ),
                SettingsTile.switchTile(
                   onToggle: ref.read(themeStateProvider.notifier).setTheme,
                   initialValue: ref.watch(themeStateProvider) == ThemeMode.light,
                   leading: const Icon(Icons.dark_mode),
                   title: const Text('Toggle theme'),
                 ),
                SettingsTile.switchTile(
                    initialValue: notificationState.value ?? false,
                    onToggle: (bool value) => ref.watch(notificationStateProvider.notifier).updatePermission(value),
                    title: const Text('All Notifications'),
                    description: const Text("Revoke or grant access to all notifications.")),
                SettingsTile(
                    title: const Text("Delete cache"),
                    leading: const Icon(Icons.cached),
                    onPressed: (context) => deleteCache(ref, context),),
              ],
            ),
            SettingsSection(
              title: const Text('User Settings'),
              tiles: [
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Edit profile'),
                  onPressed: (context) => context.pushNamed("profileSettings"),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.password),
                  title: const Text('Edit password'),
                  onPressed: (context) => context.pushNamed("pswSettings"),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.email),
                  title: const Text('Edit email'),
                  onPressed: (context) => context.pushNamed("emailSettings"),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.hide_image),
                  title: const Text('Edit hidden posts'),
                  onPressed: (context) => context.pushNamed("hiddenPostSettings"),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.hide_source),
                  title: const Text('Edit hidden users'),
                  onPressed: (context) => context.pushNamed("hiddenUserSettings"),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('About'),
              tiles: [
                SettingsTile.navigation(
                  leading: const Icon(Icons.contact_support),
                  title: const Text('Contact developer'),
                  onPressed: (context) => context.pushNamed("report", extra: ["Bug", "Feature Request", "Other"]),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.document_scanner),
                  title: const Text('Privacy Policy'),
                  onPressed: (context) {
                    context.pushNamed('web', queryParameters: {'url': "${ref.watch(globalDataServiceProvider).host}/public/privacy-policy", 'title': "Privacy Policy"});
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.document_scanner),
                  title: const Text('Terms of Service'),
                  onPressed: (context) {
                    context.pushNamed('web', queryParameters: {'url': "${ref.watch(globalDataServiceProvider).host}/public/agb", 'title': "Terms of Service"});
                  }
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.document_scanner),
                  title: const Text('OpenStreetMap Copyright'),
                  onPressed: (context) {
                    context.pushNamed('web', queryParameters: {'url': "https://www.openstreetmap.org/copyright", 'title': "Terms of Service"});
                  },
                ),
                SettingsTile(
                  leading: const Icon(Icons.share),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: () => clickedOnLink(dotenv.env["DISCORD_INVITE"]), icon: const Icon(Icons.discord), iconSize: 30, color: Theme.of(context).iconTheme.color),
                      SocialMediaButton.instagram(onTap: () => clickedOnLink(dotenv.env["INSTAGRAM_URL"]), size: 30, color: Theme.of(context).iconTheme.color,) ,
                      SocialMediaButton.github(onTap: () => clickedOnLink(dotenv.env["URL_GITHUB_REPO"]), size: 30, color: Theme.of(context).iconTheme.color),
                      IconButton(onPressed: () => InAppReview.instance.openStoreListing(appStoreId: dotenv.env["APPSTORE_ID"]), icon: const Icon(Icons.star_border), iconSize: 30, color: Theme.of(context).iconTheme.color),
                    ],
                  ),
                ),
              ],
            ),
            SettingsSection(title: const Text("Logout"), tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text(
                  'Delete Account',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: (context) => context.pushNamed("deleteSettings"),
              ),
              SettingsTile.navigation(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: (c2) => showDialog(
                      context: c2,
                      builder: (c) => CustomDialog(
                            title: "Confirm Logout",
                            text2: "Logout",
                            text1: "Cancel",
                            onPressed: () async {
                              await ref.read(globalDataServiceProvider.notifier).logout();
                              await invalidateCache();
                              if (!context.mounted) return;
                              context.goNamed("login");
                            },
                          ),),),
            ],),
          ],
        ),);
  }

  void deleteCache(WidgetRef ref, BuildContext context) {
    CustomDialog.show(context,
        acceptText: "Delete",
        title: "Delete Cache",
        cancelText: "Cancel",
        child: const Text(
            "Deleting the cache can fix wrong states of the app caused by outdated data. This does not log you out and an automatic refresh of all deleted data is performed. IMPORTANT: Posts that are not synced to the server will be lost forever.",
            maxLines: 10,), onPressed: () async {
          await invalidateCache();
          ref.read(syncingServiceProvider.notifier).toInit();
          ref.read(syncingServiceProvider.notifier).syncToBackend();
          if (!context.mounted) return;
          Navigator.of(context).pop();
        },
    );
  }

  void showLoading() {
    showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) => Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 15),
                Text(
                  "Please don't close this screen, this can take a few seconds",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

Future<void> invalidateCache() async {
    showLoading();

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
    
    // Changed to read() to prevent Riverpod crashes
    final sharedPreferences = ref.read(sharedPreferencesProvider); 

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
    final mgmt = const FMTCStore('tileStore').manage;
    await mgmt.reset();
    
    await sharedPreferences.clear();
    await DefaultCacheManager().emptyCache();
    
    // 4. Invalidate the syncing service last
    ref.invalidate(lastSeenProvider);
  }
}
