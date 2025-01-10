import 'package:buff_lisa/data/service/shared_preferences_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_service.g.dart';

@Riverpod(keepAlive: true)
class HiddenUserService extends _$HiddenUserService {

  @override
  List<String> build() {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    return sharedPrefs.getStringList('hiddenUsers') ?? [];
  }


  void addHiddenUser(String userId) {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    final hiddenUsers = sharedPrefs.getStringList('hiddenUsers') ?? [];
    hiddenUsers.add(userId);
    sharedPrefs.setStringList('hiddenUsers', hiddenUsers);
    state = hiddenUsers;
  }

  void removeHiddenUser(String userId) {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    final hiddenUsers = sharedPrefs.getStringList('hiddenUsers') ?? [];
    hiddenUsers.remove(userId);
    sharedPrefs.setStringList('hiddenUsers', hiddenUsers);
    state = hiddenUsers;
  }

}


@Riverpod(keepAlive: true)
class HiddenPostsService extends _$HiddenPostsService {

  @override
  List<String> build() {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    return sharedPrefs.getStringList('hiddenPosts') ?? [];
  }


  void addHiddenPost(String pinId) {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    final hiddenPosts = sharedPrefs.getStringList('hiddenPosts') ?? [];
    hiddenPosts.add(pinId);
    sharedPrefs.setStringList('hiddenPosts', hiddenPosts);
    state = hiddenPosts;
  }

  void removeHiddenPost(String postId) {
    final sharedPrefs = ref.watch(sharedPreferencesProvider);
    final hiddenPosts = sharedPrefs.getStringList('hiddenPosts') ?? [];
    hiddenPosts.remove(postId);
    sharedPrefs.setStringList('hiddenPosts', hiddenPosts);
    state = hiddenPosts;
  }

}
