// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CameraIndex)
const cameraIndexProvider = CameraIndexProvider._();

final class CameraIndexProvider extends $NotifierProvider<CameraIndex, int> {
  const CameraIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cameraIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cameraIndexHash();

  @$internal
  @override
  CameraIndex create() => CameraIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cameraIndexHash() => r'1586261879e9dbbace237e964af490a507397937';

abstract class _$CameraIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(CameraValues)
const cameraValuesProvider = CameraValuesFamily._();

final class CameraValuesProvider
    extends $AsyncNotifierProvider<CameraValues, CameraState> {
  const CameraValuesProvider._({
    required CameraValuesFamily super.from,
    required CameraController super.argument,
  }) : super(
         retry: null,
         name: r'cameraValuesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cameraValuesHash();

  @override
  String toString() {
    return r'cameraValuesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CameraValues create() => CameraValues();

  @override
  bool operator ==(Object other) {
    return other is CameraValuesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cameraValuesHash() => r'dc8cdd00db744bf7c31b244af90f84c55bff2103';

final class CameraValuesFamily extends $Family
    with
        $ClassFamilyOverride<
          CameraValues,
          AsyncValue<CameraState>,
          CameraState,
          FutureOr<CameraState>,
          CameraController
        > {
  const CameraValuesFamily._()
    : super(
        retry: null,
        name: r'cameraValuesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CameraValuesProvider call(CameraController controller) =>
      CameraValuesProvider._(argument: controller, from: this);

  @override
  String toString() => r'cameraValuesProvider';
}

abstract class _$CameraValues extends $AsyncNotifier<CameraState> {
  late final _$args = ref.$arg as CameraController;
  CameraController get controller => _$args;

  FutureOr<CameraState> build(CameraController controller);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<CameraState>, CameraState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CameraState>, CameraState>,
              AsyncValue<CameraState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(CameraGroupIndex)
const cameraGroupIndexProvider = CameraGroupIndexProvider._();

final class CameraGroupIndexProvider
    extends $NotifierProvider<CameraGroupIndex, int> {
  const CameraGroupIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cameraGroupIndexProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cameraGroupIndexHash();

  @$internal
  @override
  CameraGroupIndex create() => CameraGroupIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cameraGroupIndexHash() => r'c4af013786fcd5c4ccd6b06e8abc6500005a9107';

abstract class _$CameraGroupIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(cameraSelectedGroup)
const cameraSelectedGroupProvider = CameraSelectedGroupProvider._();

final class CameraSelectedGroupProvider
    extends
        $FunctionalProvider<
          AsyncValue<LocalGroupDto>,
          LocalGroupDto,
          FutureOr<LocalGroupDto>
        >
    with $FutureModifier<LocalGroupDto>, $FutureProvider<LocalGroupDto> {
  const CameraSelectedGroupProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cameraSelectedGroupProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cameraSelectedGroupHash();

  @$internal
  @override
  $FutureProviderElement<LocalGroupDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LocalGroupDto> create(Ref ref) {
    return cameraSelectedGroup(ref);
  }
}

String _$cameraSelectedGroupHash() =>
    r'e34f8df3bcae7820db52382e7eb2854077fa2e4c';

@ProviderFor(CameraCapturing)
const cameraCapturingProvider = CameraCapturingProvider._();

final class CameraCapturingProvider
    extends $NotifierProvider<CameraCapturing, bool> {
  const CameraCapturingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cameraCapturingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cameraCapturingHash();

  @$internal
  @override
  CameraCapturing create() => CameraCapturing();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$cameraCapturingHash() => r'd82a1d173ce7bbde1bf2c3e7ffc79869833964e8';

abstract class _$CameraCapturing extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
