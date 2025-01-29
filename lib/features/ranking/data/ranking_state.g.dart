// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rankingGidHash() => r'b97a0c2715209e17aca9908bd67d31323a9a3506';

/// See also [RankingGid].
@ProviderFor(RankingGid)
final rankingGidProvider =
    AutoDisposeNotifierProvider<RankingGid, RankingSearchDtoInner?>.internal(
  RankingGid.new,
  name: r'rankingGidProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$rankingGidHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RankingGid = AutoDisposeNotifier<RankingSearchDtoInner?>;
String _$rankingSearchHash() => r'160b6ac38994aeda2cabe3c1f7808fcb71351706';

/// See also [RankingSearch].
@ProviderFor(RankingSearch)
final rankingSearchProvider =
    AsyncNotifierProvider<RankingSearch, List<RankingSearchDtoInner>>.internal(
  RankingSearch.new,
  name: r'rankingSearchProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rankingSearchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RankingSearch = AsyncNotifier<List<RankingSearchDtoInner>>;
String _$rankingTimeSelectorHash() =>
    r'1f05a6bea0fa72649132ceee63bd4a122e852f4d';

/// See also [RankingTimeSelector].
@ProviderFor(RankingTimeSelector)
final rankingTimeSelectorProvider =
    AutoDisposeNotifierProvider<RankingTimeSelector, int>.internal(
  RankingTimeSelector.new,
  name: r'rankingTimeSelectorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rankingTimeSelectorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RankingTimeSelector = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
