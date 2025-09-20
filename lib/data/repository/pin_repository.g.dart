// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pinRepository)
const pinRepositoryProvider = PinRepositoryProvider._();

final class PinRepositoryProvider
    extends $FunctionalProvider<PinRepository, PinRepository, PinRepository>
    with $Provider<PinRepository> {
  const PinRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pinRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pinRepositoryHash();

  @$internal
  @override
  $ProviderElement<PinRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PinRepository create(Ref ref) {
    return pinRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PinRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PinRepository>(value),
    );
  }
}

String _$pinRepositoryHash() => r'e9c71e7ad4bb7fd09e023aa9cba6cf667c79a130';

@ProviderFor(otherPinRepository)
const otherPinRepositoryProvider = OtherPinRepositoryProvider._();

final class OtherPinRepositoryProvider
    extends
        $FunctionalProvider<
          OtherPinRepository,
          OtherPinRepository,
          OtherPinRepository
        >
    with $Provider<OtherPinRepository> {
  const OtherPinRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'otherPinRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$otherPinRepositoryHash();

  @$internal
  @override
  $ProviderElement<OtherPinRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OtherPinRepository create(Ref ref) {
    return otherPinRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OtherPinRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OtherPinRepository>(value),
    );
  }
}

String _$otherPinRepositoryHash() =>
    r'909a627aa32009f2ca3f9bdee01de11a17b537fa';

@ProviderFor(pinLikeRepository)
const pinLikeRepositoryProvider = PinLikeRepositoryProvider._();

final class PinLikeRepositoryProvider
    extends
        $FunctionalProvider<
          PinLikeRepository,
          PinLikeRepository,
          PinLikeRepository
        >
    with $Provider<PinLikeRepository> {
  const PinLikeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pinLikeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pinLikeRepositoryHash();

  @$internal
  @override
  $ProviderElement<PinLikeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PinLikeRepository create(Ref ref) {
    return pinLikeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PinLikeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PinLikeRepository>(value),
    );
  }
}

String _$pinLikeRepositoryHash() => r'53271d6bffe942634475e82b91423fe4c49626e2';
