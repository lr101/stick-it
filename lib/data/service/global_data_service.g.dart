// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_data_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$globalDataServiceHash() => r'e61ae8da082d7e24f6769f2b5e5f7027a0619b88';

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
String _$lastSeenHash() => r'38fc1f14c7c2aecf169bcad10b1d591b31e1fa59';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
