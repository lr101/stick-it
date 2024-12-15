import 'package:buff_lisa/data/entity/database.dart';
import 'package:buff_lisa/data/service/group_image_service.dart';
import 'package:buff_lisa/data/service/member_service.dart';
import 'package:buff_lisa/data/service/no_user_group_service.dart';
import 'package:buff_lisa/data/service/pin_image_service.dart';
import 'package:buff_lisa/data/service/pin_service.dart';
import 'package:buff_lisa/data/service/shared_preferences_service.dart';
import 'package:buff_lisa/data/service/user_group_service.dart';
import 'package:buff_lisa/data/service/user_image_service.dart';
import 'package:buff_lisa/data/service/user_image_service_small.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:buff_lisa/features/auth/presentation/auth.dart';
import 'package:buff_lisa/features/settings/presentation/sub_widgets/change_email.dart';
import 'package:buff_lisa/features/settings/presentation/sub_widgets/change_password.dart';
import 'package:buff_lisa/features/settings/presentation/sub_widgets/change_profile.dart';
import 'package:buff_lisa/features/settings/presentation/sub_widgets/delete_account.dart';
import 'package:buff_lisa/features/settings/presentation/sub_widgets/edit_hidden_posts.dart';
import 'package:buff_lisa/features/settings/presentation/sub_widgets/edit_hidden_users.dart';
import 'package:buff_lisa/util/theme/service/theme_state.dart';
import 'package:buff_lisa/widgets/custom_feed/data/like_service.dart';
import 'package:buff_lisa/widgets/group_selector/service/group_order_service.dart';
import 'package:buff_lisa/widgets/report_issue/presentation/report_issue_page.dart';
import 'package:buff_lisa/widgets/custom_interaction/presentation/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:social_media_buttons/social_media_button.dart';
import '../../../data/service/global_data_service.dart';
import '../../../util/routing/routing.dart';
import '../../web/presentation/show_web.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
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
                SettingsTile(
                    title: const Text("Delete cache"),
                    leading: const Icon(Icons.cached),
                    onPressed: (context) => deleteCache(ref, context))
              ],
            ),
            SettingsSection(
              title: const Text('User Settings'),
              tiles: [
                SettingsTile.navigation(
                  leading: const Icon(Icons.person),
                  title: const Text('Edit profile'),
                  onPressed: (context) => Routing.to(context, const ChangeProfile()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.password),
                  title: const Text('Edit password'),
                  onPressed: (context) => Routing.to(context, const ChangePassword()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.email),
                  title: const Text('Edit email'),
                  onPressed: (context) => Routing.to(context, ChangeEmailPage())
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.hide_image),
                  title: const Text('Edit hidden posts'),
                  onPressed: (context) => Routing.to(context, EditHiddenPosts()),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.hide_source),
                  title: const Text('Edit hidden users'),
                  onPressed: (context) => Routing.to(context, EditHiddenUsers()),
                ),
              ],
            ),
            SettingsSection(
              title: const Text('About'),
              tiles: [
                SettingsTile.navigation(
                  leading: const Icon(Icons.contact_support),
                  title: const Text('Contact developer'),
                  onPressed: (context) => Routing.to(context, ReportIssuePage(issueTypes: ["Bug", "Feature Request", "Other"],)),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.document_scanner),
                  title: const Text('Privacy Policy'),
                  onPressed: (context) {
                    Routing.to(
                        context,
                        ShowWebWidget(
                          route:
                              "${ref.watch(globalDataServiceProvider).host}/public/privacy-policy",
                          title: "Privacy Policy",
                        ));
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.document_scanner),
                  title: const Text('Terms of Service'),
                  onPressed: (context) {
                    Routing.to(
                        context,
                        ShowWebWidget(
                          route:
                              "${ref.watch(globalDataServiceProvider).host}/public/agb",
                          title: "Terms of Service",
                        ));
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.document_scanner),
                  title: const Text('OpenStreetMap Copyright'),
                  onPressed: (context) {
                    Routing.to(
                        context,
                        const ShowWebWidget(
                          route: "https://www.openstreetmap.org/copyright",
                          title: "OpenStreetMap Copyright",
                        ));
                  },
                ),
                SettingsTile(
                  leading: Icon(Icons.share),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: () => Routing.clickedOnLink(dotenv.env["DISCORD_INVITE"]), icon: Icon(Icons.discord), iconSize: 30, color: Theme.of(context).iconTheme.color),
                      SocialMediaButton.instagram(onTap: () => Routing.clickedOnLink(dotenv.env["INSTAGRAM_URL"]), size: 30, color: Theme.of(context).iconTheme.color,) ,
                      SocialMediaButton.github(onTap: () => Routing.clickedOnLink(dotenv.env["GITHUB_URL"]), size: 30, color: Theme.of(context).iconTheme.color),
                      IconButton(onPressed: () => InAppReview.instance.openStoreListing(appStoreId: dotenv.env["APPSTORE_ID"]), icon: Icon(Icons.star_border), iconSize: 30, color: Theme.of(context).iconTheme.color)
                    ],
                  ),
                )
              ],
            ),
            SettingsSection(title: const Text("Logout"), tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text(
                  'Delete Account',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: (context) => Routing.to(context, DeleteAccount()),
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
                              await invalidateCache();
                              await ref.read(globalDataServiceProvider.notifier).logout();
                              Routing.toAndDelete(context, Auth(), "/login");
                            },
                          ))),
            ])
          ],
        ));
  }

  void deleteCache(WidgetRef ref, BuildContext context) {
    CustomDialog.show(context,
        acceptText: "Delete",
        title: "Delete Cache",
        cancelText: "Cancel",
        child: Text(
            "Deleting the cache can fix wrong states of the app caused by outdated data. This does not log you out and an automatic refresh of all deleted data is performed. IMPORTANT: Posts that are not synced to the server will be lost forever.",
            maxLines: 10), onPressed: () async {
          await invalidateCache();
          Navigator.of(context).pop();
        }
    );
  }

  void showLoading() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 15),
                const Text(
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
    await ref.watch(databaseProvider).deleteEverything();
    final mgmt = FMTCStore('tileStore').manage;
    await mgmt.reset();
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    await sharedPreferences.clear();
    await DefaultCacheManager().emptyCache();
    ref.invalidate(lastSeenProvider);
    ref.invalidate(pinServiceProvider);
    ref.invalidate(userImageServiceProvider);
    ref.invalidate(userImageServiceSmallProvider);
    ref.invalidate(pinImageServiceProvider);
    ref.invalidate(memberServiceProvider);
    ref.invalidate(noUserGroupServiceProvider);
    ref.invalidate(likeServiceProvider);
    ref.invalidate(groupImageServiceProvider);
    ref.invalidate(userGroupServiceProvider);
    ref.invalidate(groupOrderServiceProvider);
  }
}
