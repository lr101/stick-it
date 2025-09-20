// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_create_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GroupCreateService)
const groupCreateServiceProvider = GroupCreateServiceProvider._();

final class GroupCreateServiceProvider
    extends $NotifierProvider<GroupCreateService, GroupCreateState> {
  const GroupCreateServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupCreateServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupCreateServiceHash();

  @$internal
  @override
  GroupCreateService create() => GroupCreateService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GroupCreateState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GroupCreateState>(value),
    );
  }
}

String _$groupCreateServiceHash() =>
    r'adb0e3be739d8531f7c742e18b5c8c42bd4581a0';

abstract class _$GroupCreateService extends $Notifier<GroupCreateState> {
  GroupCreateState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GroupCreateState, GroupCreateState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GroupCreateState, GroupCreateState>,
              GroupCreateState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(createGroupProfileImage)
const createGroupProfileImageProvider = CreateGroupProfileImageProvider._();

final class CreateGroupProfileImageProvider
    extends $FunctionalProvider<Uint8List?, Uint8List?, Uint8List?>
    with $Provider<Uint8List?> {
  const CreateGroupProfileImageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createGroupProfileImageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createGroupProfileImageHash();

  @$internal
  @override
  $ProviderElement<Uint8List?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Uint8List? create(Ref ref) {
    return createGroupProfileImage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Uint8List? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Uint8List?>(value),
    );
  }
}

String _$createGroupProfileImageHash() =>
    r'822f1e78afb6eae7561b85ab5ca2f287a646fc57';
