// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cameraControllerHash() => r'b86905301ef75bfa61c40e6e204b01312925699c';

/// See also [cameraController].
@ProviderFor(cameraController)
final cameraControllerProvider =
    AutoDisposeFutureProvider<CameraController>.internal(
      cameraController,
      name: r'cameraControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$cameraControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CameraControllerRef = AutoDisposeFutureProviderRef<CameraController>;
String _$cameraSelectedGroupHash() =>
    r'20b2944e0366e993adcc4ccf61c088ef2ae0bff7';

/// See also [cameraSelectedGroup].
@ProviderFor(cameraSelectedGroup)
final cameraSelectedGroupProvider =
    AutoDisposeFutureProvider<GroupEntity>.internal(
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
typedef CameraSelectedGroupRef = AutoDisposeFutureProviderRef<GroupEntity>;
String _$cameraIndexHash() => r'1586261879e9dbbace237e964af490a507397937';

/// See also [CameraIndex].
@ProviderFor(CameraIndex)
final cameraIndexProvider =
    AutoDisposeNotifierProvider<CameraIndex, int>.internal(
      CameraIndex.new,
      name: r'cameraIndexProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$cameraIndexHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CameraIndex = AutoDisposeNotifier<int>;
String _$cameraValuesHash() => r'5cefd420ffd84674b5bad4884e32b9d5efc70b87';

/// See also [CameraValues].
@ProviderFor(CameraValues)
final cameraValuesProvider =
    AutoDisposeAsyncNotifierProvider<CameraValues, CameraState>.internal(
      CameraValues.new,
      name: r'cameraValuesProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$cameraValuesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CameraValues = AutoDisposeAsyncNotifier<CameraState>;
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
String _$cameraCapturingHash() => r'085c4bc10e7ad57d76a4866256c2ffdd6d795047';

/// See also [CameraCapturing].
@ProviderFor(CameraCapturing)
final cameraCapturingProvider =
    NotifierProvider<CameraCapturing, bool>.internal(
      CameraCapturing.new,
      name: r'cameraCapturingProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$cameraCapturingHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CameraCapturing = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
