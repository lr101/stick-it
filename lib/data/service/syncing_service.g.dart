// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syncing_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SyncingService)
const syncingServiceProvider = SyncingServiceProvider._();

final class SyncingServiceProvider
    extends $AsyncNotifierProvider<SyncingService, bool> {
  const SyncingServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncingServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncingServiceHash();

  @$internal
  @override
  SyncingService create() => SyncingService();
}

String _$syncingServiceHash() => r'c747720ad4f51d973970415be190df33a27b1b1f';

abstract class _$SyncingService extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
