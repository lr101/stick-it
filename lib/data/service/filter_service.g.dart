// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HiddenUserService)
const hiddenUserServiceProvider = HiddenUserServiceProvider._();

final class HiddenUserServiceProvider
    extends $NotifierProvider<HiddenUserService, List<String>> {
  const HiddenUserServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hiddenUserServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hiddenUserServiceHash();

  @$internal
  @override
  HiddenUserService create() => HiddenUserService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$hiddenUserServiceHash() => r'481c8937f9f6a4871da43e5590cc229ec92d006b';

abstract class _$HiddenUserService extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(HiddenPostsService)
const hiddenPostsServiceProvider = HiddenPostsServiceProvider._();

final class HiddenPostsServiceProvider
    extends $NotifierProvider<HiddenPostsService, List<String>> {
  const HiddenPostsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hiddenPostsServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hiddenPostsServiceHash();

  @$internal
  @override
  HiddenPostsService create() => HiddenPostsService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$hiddenPostsServiceHash() =>
    r'bae2a2a873b6ed44bab4a23a4d234c7a6e7bd974';

abstract class _$HiddenPostsService extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
