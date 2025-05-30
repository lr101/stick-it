// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_data_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userIdHash() => r'f2c97313ee210fb250e363e4fcf6288210cac59b';

/// See also [userId].
@ProviderFor(userId)
final userIdProvider = AutoDisposeProvider<String>.internal(
  userId,
  name: r'userIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserIdRef = AutoDisposeProviderRef<String>;
String _$lastKnownLocationHash() => r'32bf99245b9bc078cb9ab20675d6db2f5b6f0191';

/// See also [lastKnownLocation].
@ProviderFor(lastKnownLocation)
final lastKnownLocationProvider = AutoDisposeProvider<LatLng>.internal(
  lastKnownLocation,
  name: r'lastKnownLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lastKnownLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LastKnownLocationRef = AutoDisposeProviderRef<LatLng>;
String _$globalDataServiceHash() => r'e4281575bf51ae5456daf4e3694243ac85d3ae31';

/// See also [GlobalDataService].
@ProviderFor(GlobalDataService)
final globalDataServiceProvider =
    NotifierProvider<GlobalDataService, GlobalDataDto>.internal(
  GlobalDataService.new,
  name: r'globalDataServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$globalDataServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GlobalDataService = Notifier<GlobalDataDto>;
String _$authServiceHash() => r'c5e69c64abcaabf82fb42dc9d93e6305cba96df0';

/// See also [AuthService].
@ProviderFor(AuthService)
final authServiceProvider =
    AutoDisposeAsyncNotifierProvider<AuthService, bool>.internal(
  AuthService.new,
  name: r'authServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthService = AutoDisposeAsyncNotifier<bool>;
String _$cameraTorchHash() => r'd9b867808565232d7ea3ccb93b3f588211414af4';

/// See also [CameraTorch].
@ProviderFor(CameraTorch)
final cameraTorchProvider =
    AutoDisposeNotifierProvider<CameraTorch, bool>.internal(
  CameraTorch.new,
  name: r'cameraTorchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cameraTorchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CameraTorch = AutoDisposeNotifier<bool>;
String _$lastSeenHash() => r'2116a21cd5c291835d95e9b948f7cd80f579e40f';

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

abstract class _$LastSeen extends BuildlessNotifier<DateTime?> {
  late final String key;

  DateTime? build(
    String key,
  );
}

/// See also [LastSeen].
@ProviderFor(LastSeen)
const lastSeenProvider = LastSeenFamily();

/// See also [LastSeen].
class LastSeenFamily extends Family<DateTime?> {
  /// See also [LastSeen].
  const LastSeenFamily();

  /// See also [LastSeen].
  LastSeenProvider call(
    String key,
  ) {
    return LastSeenProvider(
      key,
    );
  }

  @override
  LastSeenProvider getProviderOverride(
    covariant LastSeenProvider provider,
  ) {
    return call(
      provider.key,
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
  String? get name => r'lastSeenProvider';
}

/// See also [LastSeen].
class LastSeenProvider extends NotifierProviderImpl<LastSeen, DateTime?> {
  /// See also [LastSeen].
  LastSeenProvider(
    String key,
  ) : this._internal(
          () => LastSeen()..key = key,
          from: lastSeenProvider,
          name: r'lastSeenProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lastSeenHash,
          dependencies: LastSeenFamily._dependencies,
          allTransitiveDependencies: LastSeenFamily._allTransitiveDependencies,
          key: key,
        );

  LastSeenProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
  }) : super.internal();

  final String key;

  @override
  DateTime? runNotifierBuild(
    covariant LastSeen notifier,
  ) {
    return notifier.build(
      key,
    );
  }

  @override
  Override overrideWith(LastSeen Function() create) {
    return ProviderOverride(
      origin: this,
      override: LastSeenProvider._internal(
        () => create()..key = key,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        key: key,
      ),
    );
  }

  @override
  NotifierProviderElement<LastSeen, DateTime?> createElement() {
    return _LastSeenProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LastSeenProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LastSeenRef on NotifierProviderRef<DateTime?> {
  /// The parameter `key` of this provider.
  String get key;
}

class _LastSeenProviderElement
    extends NotifierProviderElement<LastSeen, DateTime?> with LastSeenRef {
  _LastSeenProviderElement(super.provider);

  @override
  String get key => (origin as LastSeenProvider).key;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
