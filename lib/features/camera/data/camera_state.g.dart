// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cameraSelectedGroupHash() =>
    r'57b61a985cd8df544000f575d13c055a1d1b3568';

/// See also [cameraSelectedGroup].
@ProviderFor(cameraSelectedGroup)
final cameraSelectedGroupProvider = Provider<LocalGroupDto>.internal(
  cameraSelectedGroup,
  name: r'cameraSelectedGroupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cameraSelectedGroupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CameraSelectedGroupRef = ProviderRef<LocalGroupDto>;
String _$cameraIndexHash() => r'2acc52147deba74fc547bc9a8c2de36017647cf9';

/// See also [CameraIndex].
@ProviderFor(CameraIndex)
final cameraIndexProvider =
    AutoDisposeNotifierProvider<CameraIndex, int>.internal(
  CameraIndex.new,
  name: r'cameraIndexProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cameraIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CameraIndex = AutoDisposeNotifier<int>;
String _$cameraValuesHash() => r'04dc4771f764b5c78e0198ddc6aabdfeedfc7a19';

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

abstract class _$CameraValues
    extends BuildlessAutoDisposeAsyncNotifier<CameraState> {
  late final CameraController controller;

  FutureOr<CameraState> build(
    CameraController controller,
  );
}

/// See also [CameraValues].
@ProviderFor(CameraValues)
const cameraValuesProvider = CameraValuesFamily();

/// See also [CameraValues].
class CameraValuesFamily extends Family<AsyncValue<CameraState>> {
  /// See also [CameraValues].
  const CameraValuesFamily();

  /// See also [CameraValues].
  CameraValuesProvider call(
    CameraController controller,
  ) {
    return CameraValuesProvider(
      controller,
    );
  }

  @override
  CameraValuesProvider getProviderOverride(
    covariant CameraValuesProvider provider,
  ) {
    return call(
      provider.controller,
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
  String? get name => r'cameraValuesProvider';
}

/// See also [CameraValues].
class CameraValuesProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CameraValues, CameraState> {
  /// See also [CameraValues].
  CameraValuesProvider(
    CameraController controller,
  ) : this._internal(
          () => CameraValues()..controller = controller,
          from: cameraValuesProvider,
          name: r'cameraValuesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cameraValuesHash,
          dependencies: CameraValuesFamily._dependencies,
          allTransitiveDependencies:
              CameraValuesFamily._allTransitiveDependencies,
          controller: controller,
        );

  CameraValuesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.controller,
  }) : super.internal();

  final CameraController controller;

  @override
  FutureOr<CameraState> runNotifierBuild(
    covariant CameraValues notifier,
  ) {
    return notifier.build(
      controller,
    );
  }

  @override
  Override overrideWith(CameraValues Function() create) {
    return ProviderOverride(
      origin: this,
      override: CameraValuesProvider._internal(
        () => create()..controller = controller,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        controller: controller,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CameraValues, CameraState>
      createElement() {
    return _CameraValuesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CameraValuesProvider && other.controller == controller;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CameraValuesRef on AutoDisposeAsyncNotifierProviderRef<CameraState> {
  /// The parameter `controller` of this provider.
  CameraController get controller;
}

class _CameraValuesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CameraValues, CameraState>
    with CameraValuesRef {
  _CameraValuesProviderElement(super.provider);

  @override
  CameraController get controller =>
      (origin as CameraValuesProvider).controller;
}

String _$cameraGroupIndexHash() => r'c4af013786fcd5c4ccd6b06e8abc6500005a9107';

/// See also [CameraGroupIndex].
@ProviderFor(CameraGroupIndex)
final cameraGroupIndexProvider =
    NotifierProvider<CameraGroupIndex, int>.internal(
  CameraGroupIndex.new,
  name: r'cameraGroupIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cameraGroupIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CameraGroupIndex = Notifier<int>;
String _$cameraCapturingHash() => r'd82a1d173ce7bbde1bf2c3e7ffc79869833964e8';

/// See also [CameraCapturing].
@ProviderFor(CameraCapturing)
final cameraCapturingProvider =
    AutoDisposeNotifierProvider<CameraCapturing, bool>.internal(
  CameraCapturing.new,
  name: r'cameraCapturingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cameraCapturingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CameraCapturing = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
