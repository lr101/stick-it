// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_map_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$feedMapStateHash() => r'a7d42ddf7eb5756f0bc5d2e604d8a367c485af93';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FeedMapState extends BuildlessAutoDisposeNotifier<bool> {
  late final String pinId;

  bool build(
    String pinId,
  );
}

/// See also [FeedMapState].
@ProviderFor(FeedMapState)
const feedMapStateProvider = FeedMapStateFamily();

/// See also [FeedMapState].
class FeedMapStateFamily extends Family<bool> {
  /// See also [FeedMapState].
  const FeedMapStateFamily();

  /// See also [FeedMapState].
  FeedMapStateProvider call(
    String pinId,
  ) {
    return FeedMapStateProvider(
      pinId,
    );
  }

  @override
  FeedMapStateProvider getProviderOverride(
    covariant FeedMapStateProvider provider,
  ) {
    return call(
      provider.pinId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'feedMapStateProvider';
}

/// See also [FeedMapState].
class FeedMapStateProvider
    extends AutoDisposeNotifierProviderImpl<FeedMapState, bool> {
  /// See also [FeedMapState].
  FeedMapStateProvider(
    String pinId,
  ) : this._internal(
          () => FeedMapState()..pinId = pinId,
          from: feedMapStateProvider,
          name: r'feedMapStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$feedMapStateHash,
          dependencies: FeedMapStateFamily._dependencies,
          allTransitiveDependencies:
              FeedMapStateFamily._allTransitiveDependencies,
          pinId: pinId,
        );

  FeedMapStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pinId,
  }) : super.internal();

  final String pinId;

  @override
  bool runNotifierBuild(
    covariant FeedMapState notifier,
  ) {
    return notifier.build(
      pinId,
    );
  }

  @override
  Override overrideWith(FeedMapState Function() create) {
    return ProviderOverride(
      origin: this,
      override: FeedMapStateProvider._internal(
        () => create()..pinId = pinId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pinId: pinId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FeedMapState, bool> createElement() {
    return _FeedMapStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FeedMapStateProvider && other.pinId == pinId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pinId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FeedMapStateRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `pinId` of this provider.
  String get pinId;
}

class _FeedMapStateProviderElement
    extends AutoDisposeNotifierProviderElement<FeedMapState, bool>
    with FeedMapStateRef {
  _FeedMapStateProviderElement(super.provider);

  @override
  String get pinId => (origin as FeedMapStateProvider).pinId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
