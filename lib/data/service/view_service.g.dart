// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ViewService)
const viewServiceProvider = ViewServiceProvider._();

final class ViewServiceProvider
    extends $NotifierProvider<ViewService, ViewState> {
  const ViewServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'viewServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$viewServiceHash();

  @$internal
  @override
  ViewService create() => ViewService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ViewState>(value),
    );
  }
}

String _$viewServiceHash() => r'7a900cc560e5fe74c52a9192ebde738fb14b5763';

abstract class _$ViewService extends $Notifier<ViewState> {
  ViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ViewState, ViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ViewState, ViewState>,
              ViewState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
