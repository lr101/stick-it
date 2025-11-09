// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marker_window_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MarkerWindowState)
const markerWindowStateProvider = MarkerWindowStateProvider._();

final class MarkerWindowStateProvider
    extends $NotifierProvider<MarkerWindowState, LocalPinDto?> {
  const MarkerWindowStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'markerWindowStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$markerWindowStateHash();

  @$internal
  @override
  MarkerWindowState create() => MarkerWindowState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalPinDto? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalPinDto?>(value),
    );
  }
}

String _$markerWindowStateHash() => r'c8e3a5a92d864922fa5301bb85431ddaff04b184';

abstract class _$MarkerWindowState extends $Notifier<LocalPinDto?> {
  LocalPinDto? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LocalPinDto?, LocalPinDto?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LocalPinDto?, LocalPinDto?>,
              LocalPinDto?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
