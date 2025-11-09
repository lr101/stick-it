// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_order_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GroupOrderService)
const groupOrderServiceProvider = GroupOrderServiceProvider._();

final class GroupOrderServiceProvider
    extends $NotifierProvider<GroupOrderService, List<String>> {
  const GroupOrderServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupOrderServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupOrderServiceHash();

  @$internal
  @override
  GroupOrderService create() => GroupOrderService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$groupOrderServiceHash() => r'ba479075075e9341e20995b380fc82f7140b9bda';

abstract class _$GroupOrderService extends $Notifier<List<String>> {
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

@ProviderFor(roundGroupId)
const roundGroupIdProvider = RoundGroupIdProvider._();

final class RoundGroupIdProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const RoundGroupIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'roundGroupIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$roundGroupIdHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return roundGroupId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$roundGroupIdHash() => r'dd926cf843566b1db3f10083769172177a6cd74e';
