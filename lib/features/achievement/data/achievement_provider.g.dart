// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Achievements)
const achievementsProvider = AchievementsProvider._();

final class AchievementsProvider
    extends
        $AsyncNotifierProvider<Achievements, List<UserAchievementsDtoInner>> {
  const AchievementsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'achievementsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$achievementsHash();

  @$internal
  @override
  Achievements create() => Achievements();
}

String _$achievementsHash() => r'c9ffccced6dde16974a1284fd58d43bffaa2b907';

abstract class _$Achievements
    extends $AsyncNotifier<List<UserAchievementsDtoInner>> {
  FutureOr<List<UserAchievementsDtoInner>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<UserAchievementsDtoInner>>,
              List<UserAchievementsDtoInner>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<UserAchievementsDtoInner>>,
                List<UserAchievementsDtoInner>
              >,
              AsyncValue<List<UserAchievementsDtoInner>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
