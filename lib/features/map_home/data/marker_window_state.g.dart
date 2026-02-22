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
    extends $NotifierProvider<MarkerWindowState, PinEntity?> {
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
  Override overrideWithValue(PinEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PinEntity?>(value),
    );
  }
}

String _$markerWindowStateHash() => r'd14e0a56e4530d2b3908c27cec199e80f1daae03';

abstract class _$MarkerWindowState extends $Notifier<PinEntity?> {
  PinEntity? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PinEntity?, PinEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PinEntity?, PinEntity?>,
              PinEntity?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
