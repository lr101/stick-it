// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PinService)
const pinServiceProvider = PinServiceFamily._();

final class PinServiceProvider
    extends $AsyncNotifierProvider<PinService, Set<LocalPinDto>> {
  const PinServiceProvider._({
    required PinServiceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'pinServiceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pinServiceHash();

  @override
  String toString() {
    return r'pinServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PinService create() => PinService();

  @override
  bool operator ==(Object other) {
    return other is PinServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pinServiceHash() => r'5d0f7fd436de04ef7c53590ce229da0b2735805e';

final class PinServiceFamily extends $Family
    with
        $ClassFamilyOverride<
          PinService,
          AsyncValue<Set<LocalPinDto>>,
          Set<LocalPinDto>,
          FutureOr<Set<LocalPinDto>>,
          String
        > {
  const PinServiceFamily._()
    : super(
        retry: null,
        name: r'pinServiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PinServiceProvider call(String groupId) =>
      PinServiceProvider._(argument: groupId, from: this);

  @override
  String toString() => r'pinServiceProvider';
}

abstract class _$PinService extends $AsyncNotifier<Set<LocalPinDto>> {
  late final _$args = ref.$arg as String;
  String get groupId => _$args;

  FutureOr<Set<LocalPinDto>> build(String groupId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<Set<LocalPinDto>>, Set<LocalPinDto>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Set<LocalPinDto>>, Set<LocalPinDto>>,
              AsyncValue<Set<LocalPinDto>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(activatedPins)
const activatedPinsProvider = ActivatedPinsProvider._();

final class ActivatedPinsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Set<LocalPinDto>>,
          Set<LocalPinDto>,
          FutureOr<Set<LocalPinDto>>
        >
    with $FutureModifier<Set<LocalPinDto>>, $FutureProvider<Set<LocalPinDto>> {
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
  $FutureProviderElement<Set<LocalPinDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Set<LocalPinDto>> create(Ref ref) {
    return activatedPins(ref);
  }
}

String _$activatedPinsHash() => r'9573209725906800de2b5007857da8873c02f5b6';

@ProviderFor(activatedPinsWithoutLoading)
const activatedPinsWithoutLoadingProvider =
    ActivatedPinsWithoutLoadingProvider._();

final class ActivatedPinsWithoutLoadingProvider
    extends
        $FunctionalProvider<
          Set<LocalPinDto>,
          Set<LocalPinDto>,
          Set<LocalPinDto>
        >
    with $Provider<Set<LocalPinDto>> {
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
  $ProviderElement<Set<LocalPinDto>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Set<LocalPinDto> create(Ref ref) {
    return activatedPinsWithoutLoading(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<LocalPinDto> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<LocalPinDto>>(value),
    );
  }
}

String _$activatedPinsWithoutLoadingHash() =>
    r'963dd78336b37523f60edb3a6781a0fca960ef4a';

@ProviderFor(sortedActivatedPins)
const sortedActivatedPinsProvider = SortedActivatedPinsProvider._();

final class SortedActivatedPinsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LocalPinDto>>,
          List<LocalPinDto>,
          FutureOr<List<LocalPinDto>>
        >
    with
        $FutureModifier<List<LocalPinDto>>,
        $FutureProvider<List<LocalPinDto>> {
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
  $FutureProviderElement<List<LocalPinDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LocalPinDto>> create(Ref ref) {
    return sortedActivatedPins(ref);
  }
}

String _$sortedActivatedPinsHash() =>
    r'b7ae537c50ec211ab28a4700ca28060c8891fc88';

@ProviderFor(sortedGroupPins)
const sortedGroupPinsProvider = SortedGroupPinsFamily._();

final class SortedGroupPinsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LocalPinDto>?>,
          List<LocalPinDto>?,
          FutureOr<List<LocalPinDto>?>
        >
    with
        $FutureModifier<List<LocalPinDto>?>,
        $FutureProvider<List<LocalPinDto>?> {
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
  $FutureProviderElement<List<LocalPinDto>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LocalPinDto>?> create(Ref ref) {
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

String _$sortedGroupPinsHash() => r'23dbccfee5ac1e9dd3c262c0bcb63e500539867a';

final class SortedGroupPinsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<LocalPinDto>?>, String> {
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

@ProviderFor(pinsSortedByDistance)
const pinsSortedByDistanceProvider = PinsSortedByDistanceProvider._();

final class PinsSortedByDistanceProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MapEntry<LocalPinDto, double>>>,
          AsyncValue<List<MapEntry<LocalPinDto, double>>>,
          AsyncValue<List<MapEntry<LocalPinDto, double>>>
        >
    with $Provider<AsyncValue<List<MapEntry<LocalPinDto, double>>>> {
  const PinsSortedByDistanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pinsSortedByDistanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pinsSortedByDistanceHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<List<MapEntry<LocalPinDto, double>>>>
  $createElement($ProviderPointer pointer) => $ProviderElement(pointer);

  @override
  AsyncValue<List<MapEntry<LocalPinDto, double>>> create(Ref ref) {
    return pinsSortedByDistance(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    AsyncValue<List<MapEntry<LocalPinDto, double>>> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<AsyncValue<List<MapEntry<LocalPinDto, double>>>>(
            value,
          ),
    );
  }
}

String _$pinsSortedByDistanceHash() =>
    r'bc056691a0787e10359700bd7ac8645c4a89e2ef';
