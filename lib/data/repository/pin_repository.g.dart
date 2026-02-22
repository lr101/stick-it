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

String _$pinRepositoryHash() => r'084d9641b14485c6161ee7d96334fbd9a068e4f2';

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

String _$pinLikeRepositoryHash() => r'e545e1ddb50fd7deaee25134f67c37c631dfcd14';
