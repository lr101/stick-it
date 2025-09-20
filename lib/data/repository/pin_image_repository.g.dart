// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_image_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pinImageRepository)
const pinImageRepositoryProvider = PinImageRepositoryProvider._();

final class PinImageRepositoryProvider
    extends
        $FunctionalProvider<
          PinImageRepository,
          PinImageRepository,
          PinImageRepository
        >
    with $Provider<PinImageRepository> {
  const PinImageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pinImageRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pinImageRepositoryHash();

  @$internal
  @override
  $ProviderElement<PinImageRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PinImageRepository create(Ref ref) {
    return pinImageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PinImageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PinImageRepository>(value),
    );
  }
}

String _$pinImageRepositoryHash() =>
    r'0cb327d9ed1ee0124f9f6add8425b3d8e71d09ff';
