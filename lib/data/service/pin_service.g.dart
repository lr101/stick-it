// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PinUserService)
const pinUserServiceProvider = PinUserServiceFamily._();

final class PinUserServiceProvider
    extends $StreamNotifierProvider<PinUserService, List<PinEntity>> {
  const PinUserServiceProvider._({
    required PinUserServiceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'pinUserServiceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pinUserServiceHash();

  @override
  String toString() {
    return r'pinUserServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PinUserService create() => PinUserService();

  @override
  bool operator ==(Object other) {
    return other is PinUserServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pinUserServiceHash() => r'0de1ccc25f60d19be7abc5a4c3237c02fa2183f2';

final class PinUserServiceFamily extends $Family
    with
        $ClassFamilyOverride<
          PinUserService,
          AsyncValue<List<PinEntity>>,
          List<PinEntity>,
          Stream<List<PinEntity>>,
          String
        > {
  const PinUserServiceFamily._()
    : super(
        retry: null,
        name: r'pinUserServiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PinUserServiceProvider call(String userId) =>
      PinUserServiceProvider._(argument: userId, from: this);

  @override
  String toString() => r'pinUserServiceProvider';
}

abstract class _$PinUserService extends $StreamNotifier<List<PinEntity>> {
  late final _$args = ref.$arg as String;
  String get userId => _$args;

  Stream<List<PinEntity>> build(String userId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<List<PinEntity>>, List<PinEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PinEntity>>, List<PinEntity>>,
              AsyncValue<List<PinEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(pinById)
const pinByIdProvider = PinByIdFamily._();

final class PinByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<PinEntity?>,
          PinEntity?,
          Stream<PinEntity?>
        >
    with $FutureModifier<PinEntity?>, $StreamProvider<PinEntity?> {
  const PinByIdProvider._({
    required PinByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'pinByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pinByIdHash();

  @override
  String toString() {
    return r'pinByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<PinEntity?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<PinEntity?> create(Ref ref) {
    final argument = this.argument as String;
    return pinById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PinByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pinByIdHash() => r'1a1e4f501efa48ab7da6797122bd08e222d42fd5';

final class PinByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<PinEntity?>, String> {
  const PinByIdFamily._()
    : super(
        retry: null,
        name: r'pinByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PinByIdProvider call(String pinId) =>
      PinByIdProvider._(argument: pinId, from: this);

  @override
  String toString() => r'pinByIdProvider';
}

@ProviderFor(PinGroupService)
const pinGroupServiceProvider = PinGroupServiceFamily._();

final class PinGroupServiceProvider
    extends $StreamNotifierProvider<PinGroupService, List<PinEntity>> {
  const PinGroupServiceProvider._({
    required PinGroupServiceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'pinGroupServiceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pinGroupServiceHash();

  @override
  String toString() {
    return r'pinGroupServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PinGroupService create() => PinGroupService();

  @override
  bool operator ==(Object other) {
    return other is PinGroupServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pinGroupServiceHash() => r'cfea71e6e44811698a17c4c367edbc9cba4063b4';

final class PinGroupServiceFamily extends $Family
    with
        $ClassFamilyOverride<
          PinGroupService,
          AsyncValue<List<PinEntity>>,
          List<PinEntity>,
          Stream<List<PinEntity>>,
          String
        > {
  const PinGroupServiceFamily._()
    : super(
        retry: null,
        name: r'pinGroupServiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PinGroupServiceProvider call(String groupId) =>
      PinGroupServiceProvider._(argument: groupId, from: this);

  @override
  String toString() => r'pinGroupServiceProvider';
}

abstract class _$PinGroupService extends $StreamNotifier<List<PinEntity>> {
  late final _$args = ref.$arg as String;
  String get groupId => _$args;

  Stream<List<PinEntity>> build(String groupId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<List<PinEntity>>, List<PinEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<PinEntity>>, List<PinEntity>>,
              AsyncValue<List<PinEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(pinService)
const pinServiceProvider = PinServiceProvider._();

final class PinServiceProvider
    extends $FunctionalProvider<PinService, PinService, PinService>
    with $Provider<PinService> {
  const PinServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pinServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pinServiceHash();

  @$internal
  @override
  $ProviderElement<PinService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PinService create(Ref ref) {
    return pinService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PinService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PinService>(value),
    );
  }
}

String _$pinServiceHash() => r'd6a0c27cba6a7bf7c80844deac1efa6a24b5ac81';

@ProviderFor(activatedPins)
const activatedPinsProvider = ActivatedPinsProvider._();

final class ActivatedPinsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Set<PinEntity>>,
          Set<PinEntity>,
          FutureOr<Set<PinEntity>>
        >
    with $FutureModifier<Set<PinEntity>>, $FutureProvider<Set<PinEntity>> {
  const ActivatedPinsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activatedPinsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activatedPinsHash();

  @$internal
  @override
  $FutureProviderElement<Set<PinEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Set<PinEntity>> create(Ref ref) {
    return activatedPins(ref);
  }
}

String _$activatedPinsHash() => r'08f0dc0b824ea3827ca6421dde19930763503783';

@ProviderFor(activatedPinsWithoutLoading)
const activatedPinsWithoutLoadingProvider =
    ActivatedPinsWithoutLoadingProvider._();

final class ActivatedPinsWithoutLoadingProvider
    extends $FunctionalProvider<Set<PinEntity>, Set<PinEntity>, Set<PinEntity>>
    with $Provider<Set<PinEntity>> {
  const ActivatedPinsWithoutLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activatedPinsWithoutLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activatedPinsWithoutLoadingHash();

  @$internal
  @override
  $ProviderElement<Set<PinEntity>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Set<PinEntity> create(Ref ref) {
    return activatedPinsWithoutLoading(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<PinEntity> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<PinEntity>>(value),
    );
  }
}

String _$activatedPinsWithoutLoadingHash() =>
    r'6020447e25360c0eb88bfebca6404816dabdc570';

@ProviderFor(sortedActivatedPins)
const sortedActivatedPinsProvider = SortedActivatedPinsProvider._();

final class SortedActivatedPinsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PinEntity>>,
          List<PinEntity>,
          FutureOr<List<PinEntity>>
        >
    with $FutureModifier<List<PinEntity>>, $FutureProvider<List<PinEntity>> {
  const SortedActivatedPinsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sortedActivatedPinsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sortedActivatedPinsHash();

  @$internal
  @override
  $FutureProviderElement<List<PinEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PinEntity>> create(Ref ref) {
    return sortedActivatedPins(ref);
  }
}

String _$sortedActivatedPinsHash() =>
    r'27a2653d9890640454aff23540f37a48c7658814';

@ProviderFor(sortedGroupPins)
const sortedGroupPinsProvider = SortedGroupPinsFamily._();

final class SortedGroupPinsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PinEntity>?>,
          List<PinEntity>?,
          FutureOr<List<PinEntity>?>
        >
    with $FutureModifier<List<PinEntity>?>, $FutureProvider<List<PinEntity>?> {
  const SortedGroupPinsProvider._({
    required SortedGroupPinsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'sortedGroupPinsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sortedGroupPinsHash();

  @override
  String toString() {
    return r'sortedGroupPinsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<PinEntity>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PinEntity>?> create(Ref ref) {
    final argument = this.argument as String;
    return sortedGroupPins(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SortedGroupPinsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sortedGroupPinsHash() => r'b50b036f312a2b0383c9e505a14257fd8cdecfbf';

final class SortedGroupPinsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<PinEntity>?>, String> {
  const SortedGroupPinsFamily._()
    : super(
        retry: null,
        name: r'sortedGroupPinsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SortedGroupPinsProvider call(String groupId) =>
      SortedGroupPinsProvider._(argument: groupId, from: this);

  @override
  String toString() => r'sortedGroupPinsProvider';
}
