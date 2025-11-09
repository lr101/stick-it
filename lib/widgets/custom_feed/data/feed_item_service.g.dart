// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_item_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(feedItem)
const feedItemProvider = FeedItemProvider._();

final class FeedItemProvider
    extends $FunctionalProvider<LocalPinDto, LocalPinDto, LocalPinDto>
    with $Provider<LocalPinDto> {
  const FeedItemProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedItemProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedItemHash();

  @$internal
  @override
  $ProviderElement<LocalPinDto> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocalPinDto create(Ref ref) {
    return feedItem(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalPinDto value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalPinDto>(value),
    );
  }
}

String _$feedItemHash() => r'ce9040449c2cc46184ea37206fb640c1ea53d34b';
