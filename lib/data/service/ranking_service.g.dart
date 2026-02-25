// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentUserTopRankingHash() =>
    r'2df4e7c6b0cd4fc635bc0ba7eaf2f980a724a2cf';

/// See also [CurrentUserTopRanking].
@ProviderFor(CurrentUserTopRanking)
final currentUserTopRankingProvider =
    AsyncNotifierProvider<
      CurrentUserTopRanking,
      List<UserRankingDtoInner>?
    >.internal(
      CurrentUserTopRanking.new,
      name: r'currentUserTopRankingProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentUserTopRankingHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CurrentUserTopRanking = AsyncNotifier<List<UserRankingDtoInner>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
