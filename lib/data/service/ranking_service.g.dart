// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Top3GroupService)
const top3GroupServiceProvider = Top3GroupServiceProvider._();

final class Top3GroupServiceProvider
    extends
        $AsyncNotifierProvider<Top3GroupService, List<GroupRankingDtoInner>?> {
  const Top3GroupServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'top3GroupServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$top3GroupServiceHash();

  @$internal
  @override
  Top3GroupService create() => Top3GroupService();
}

String _$top3GroupServiceHash() => r'55a40d39d11aa068fbbdfea3ed2495ac9c6d6995';

abstract class _$Top3GroupService
    extends $AsyncNotifier<List<GroupRankingDtoInner>?> {
  FutureOr<List<GroupRankingDtoInner>?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<GroupRankingDtoInner>?>,
              List<GroupRankingDtoInner>?
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<GroupRankingDtoInner>?>,
                List<GroupRankingDtoInner>?
              >,
              AsyncValue<List<GroupRankingDtoInner>?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
